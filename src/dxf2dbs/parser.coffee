###
Parse DXF file
###

EOF =
  id: 0
  val: 'EOF'

module.exports = (dxf)->
  pair = {}
  paths = []

  # Read next pair of lines (id + value)
  next = ->
    try
      if /^\d+$/.test id = trim dxf.ReadLine()
        pair =
          id: +id
          val: trim dxf.ReadLine()
        return
    pair = EOF

  circle = ->
    next()
    echo 'CIRCLE'

  newPolyline = ->
    next()
    echo 'LWPOLYLINE'

  oldPolyline = ->
    next()
    echo 'POLYLINE'

  next()
  loop
    switch pair.id
      when 0
        switch pair.val
          when 'EOF'
            done = true
            break
          when 'CIRCLE'
            circle()
            continue
          when 'POLYLINE'
            oldPolyline()
            continue
      when 100
        switch pair.val
          when 'AcDbCircle'
            circle()
            continue
          when 'AcDbPolyline'
            newPolyline()
            continue
    if done
      break
    next()

  paths: paths
