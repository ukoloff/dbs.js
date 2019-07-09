###
Parse DXF file
###

EOF =
  id: 0
  val: 'EOF'

module.exports = (dxf)->
  vertices = []
  thisVertex = 0
  do newVertice = ->
    vertices.push thisVertex =
      id: vertices.length
      closed: []
      nonClosed: []
      splines: []
      edges: []
    return

  pair = {}
  # Read next pair of lines (id + value)
  next = ->
    try
      if /^\d+$/.test id = trim dxf.ReadLine()
        pair =
          id: +id
          val: trim dxf.ReadLine()
        return
    pair = EOF

  line = ->
    loop
      next()
      switch pair.id
        when 0
          thisVertex.nonClosed.push [[AX, AY, 0], [ZX, ZY, 0]]
          return
        when 10
          AX = +pair.val
        when 20
          AY = +pair.val
        when 11
          ZX = +pair.val
        when 21
          ZY = +pair.val

  arc = ->
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
        when 50
          startDeg = +pair.val
        when 51
          endDeg = +pair.val

    if startDeg? and endDeg?
      # Arc
      C = [X, Y]
      angle = endDeg - startDeg
      angle -= 360 * Math.floor angle / 360
      A = dbs.point.add C, dbs.point.o2 [R, 0], dbs.o2.ccw startDeg
      A[2] = Math.tan angle * Math.PI / 720
      Z = dbs.point.add C, dbs.point.o2 [R, 0], dbs.o2.ccw endDeg
      Z[2] = 0
      C =
      thisVertex.nonClosed.push [A, Z]
    else
      # Circle
      thisVertex.closed.push [
        [X - R, Y, -1],
        [X + R, Y, -1],
        [X - R, Y, 0]
      ]
    return

  pushPolyline = (path, doClose)->
    if doClose
      path.push back = dbs.node.o2 path[0]
      back[2] = 0
      thisVertex.closed.push path
    else
      thisVertex.nonClosed.push path
    return


  newPolyline = ->
    me = []
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

    pushPolyline me, closed
    return

  oldPolyline = ->
    me = []
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
          tail[0] = +pair.val
        when 20
          # Y
          tail[1] = +pair.val
        when 42
          # Bulge
          tail[2] = +pair.val
      if done
        break
      next()

    pushPolyline me, closed
    return

  next()
  loop
    switch pair.id
      when 0
        switch pair.val
          when 'EOF'
            done = true
            break
          when 'LINE'
            line()
            continue
          when 'CIRCLE', 'ARC'
            arc()
            continue
          when 'POLYLINE'
            oldPolyline()
            continue
          when 'LWPOLYLINE'
            newPolyline()
            continue
    if done
      break
    next()

  addEdges vertices

addEdges = (vertices)->
  byName = {}
  for v in vertices when v.name
    byName[v.name] ?= v
  for v in vertices when v.name
    for edge in v.edges when toV = byName[edge.name]
      edge.vertex = toV
  vertices[0]
