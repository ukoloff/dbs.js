#
# Parse T-Flex nesting data
#
module.exports = (data)->
  assertName 'Project', data
  children = childrenHash data
  parts = partList children.Parts
  lists = partList children.Sheets

assertName = (name, node)->
  if node.name != name
    throw Error "Tag <#{node.name}> should be <#{name}>!"

fetchKey = (name, obj)->
  if !obj[name]
      throw Error "<#{name}> not found "
  obj[name]

childrenHash = (node)->
  result = {}
  if node.children
    for child in node.children
      result[child.name] = child
  result

partList = (node)->
  if !node
    return []
  result = []
  prefix = node.name.slice 0, -1
  for child in node.children
    assertName "#{prefix}Definition", child

    attrs = childrenHash child
    part =
      partid: "#{attrs.Name.children[0]}"
      paths: parsePaths fetchKey "#{prefix}Profile", attrs
    echo dbs.part.json part

parsePaths = (node)->
  for contour in fetchKey('Contours', childrenHash node).children
    assertName 'Contour', contour
    switch type = contour.attr['xsi:type']
      when 'FigureContour'
        z = figureContour contour
      when 'CircleContour'
        z = circleContour contour
      else
        throw Error "Invalid contour type: #{type}"
    if /^P/i.test childrenHash(node).Orientation
      z = dbs.path.reverse z
    z

figureContour = (node)->
  result = []
  for span in fetchKey('Objects', childrenHash node).children
    assertName 'ContourObject', span
    switch type = span.attr['xsi:type']
      when 'ContourLine'
        z = parseLine span
      when 'ContourArc'
        z = parseArc span
      else
        throw Error "Invalid ContourObject type: #{type}"
    if result.length
      result.pop()
    result.push.apply result, z
  result


circleContour = (node)->
  node = childrenHash node
  center = parseXY node.Center
  radius = parseFloat node.Radius
  [
    [center[0] - radius, center[1], -1],
    [center[0] + radius, center[1], -1]
    [center[0] - radius, center[1], 0],
  ]

parseFloat = (node)->
  Number node.children[0]

parseXY = (node)->
  node = childrenHash node
  [parseFloat(node.X), parseFloat(node.Y)]

parseLine = (node)->
  node = childrenHash node
  [parseXY(node.Begin).concat(0), parseXY(node.End).concat(0)]

parseArc = (node)->
  line = parseLine node
  angle = parseFloat fetchKey 'Angle', childrenHash node
  line[0][2] = Math.tan angle / 4
  line
