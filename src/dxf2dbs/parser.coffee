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
    echo 'CIRCLE'

  newPolyline = ->
    echo 'LWPOLYLINE'

  oldPolyline = ->
    echo 'POLYLINE'

  next()
  until done
    switch pair.id
      when 0
        switch pair.val
          when 'EOF'
            done = true
          when 'CIRCLE'
            next()
            circle()
            continue
          when 'POLYLINE'
            next()
            oldPolyline()
            continue
      when 100
        switch pair.val
          when 'AcDbCircle'
            next()
            circle()
            continue
          when 'AcDbPolyline'
            next()
            newPolyline()
            continue
    next()
