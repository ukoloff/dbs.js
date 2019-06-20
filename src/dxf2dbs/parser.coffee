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
    until done
      next()
      switch pair.id
        when 0
          done = true
        when 10
          X = +pair.val
        when 20
          Y = +pair.val
        when 40
          R = +pair.val
    paths.push [
      [X - R, Y, -1],
      [X + R, Y, -1],
      [X - R, Y, 0]
    ]
    return

  newPolyline = ->
    paths.push me = []
    until done
      next()
      switch pair.id
        when 0
          done = true
        when 10
          # X
          me.push tail = [+pair.val, 0, 0]
        when 20
          # Y
          tail[1] = +pair.val
        when 42
          # Bulge
          tail[2] = +pair.val
        when 70
          closed = 1 & +pair.val

    if closed
      close me
    return

  oldPolyline = ->
    paths.push me = []
    until done
      next()
      switch pair.id
        when 0
          done = true
        when 70
          closed = 1 & +pair.val
    done = false
    loop
      switch pair.id
        when 0
          unless done = 'VERTEX' != pair.val
            me.push tail = [0, 0, 0]
        when 10
          # X
          tail[0] = pair.val
        when 20
          # Y
          tail[1] = +pair.val
        when 42
          # Bulge
          tail[2] = +pair.val
      if done
        break
      next()

    if closed
      close me
    return

  close = (path)->
    path.push back = dbs.node.o2 path[0]
    back[2] = 0
    return

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
