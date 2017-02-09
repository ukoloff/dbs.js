###
Output as SVG
###
module.exports = (part)->
  svg = ''
  for path in part.paths
    if svg
      svg += '\n'
    svg += dbs.path.svg path
  """
  <path name="#{part.partid}" d="#{svg}"/>
  """
