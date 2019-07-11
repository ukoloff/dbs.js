###
Parse DXF file
###
dfs = require './dfs'
reorder = require './reorder'

module.exports = (dxfSrc)->
  vertices = []
  thisVertex = 0
  do newVertice = ->
    vertices.push thisVertex =
      id: vertices.length
      base: [0, 0]
      closed: []
      nonClosed: []
      splines: []
      edges: []
    return

  pair = {}
  # Read next pair of lines (id + value)
  next = ->
    unless /^\d+$/.test line = trim dxfSrc.ReadLine()
      throw Error "Invalid DXF file"
    pair =
      id: +line
      val: trim dxfSrc.ReadLine()
    return

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

  spline = ->
    thisVertex.splines.push me =
      knots: []
      controls: []
      fits: []
    loop
      next()
      switch pair.id
        when 0
          return
        when 71
          me.degree = +pair.val
        when 40
          me.knots.push +pair.val
        when 10
          me.controls.push control = [+pair.val, 0]
        when 20
          control[1] = +pair.val
        when 11
          me.fits.push fit = [+pair.val, 0]
        when 21
          fit[1] = +pair.val

  startBlock = ->
    if thisVertex.id
      throw SyntaxError "Nested BLOCK definition"
    newVertice()
    loop
      next()
      switch pair.id
        when 0
          return
        when 2
          thisVertex.name = pair.val
        when 10
          thisVertex.base[0] = +pair.val
        when 20
          thisVertex.base[1] = +pair.val

  newEdge = ->
    thisVertex.edges.push edge =
      origin: [0, 0]
      # Not used so far
      scale: [1, 1]
      angle: 0
      rows: 1
      columns: 1
      cell: [0, 0]
    loop
      next()
      switch pair.id
        when 0
          return
        when 2
          edge.name = pair.val
        when 10
          edge.origin[0] = +pair.val
        when 20
          edge.origin[1] = +pair.val
        when 41
          edge.scale[0] = +pair.val
        when 42
          edge.scale[1] = +pair.val
        when 44
          edge.cell[0] = +pair.val
        when 45
          edge.cell[1] = +pair.val
        when 50
          edge.angle = +pair.val
        when 70
          edge.columns = +pair.val
        when 71
          edge.rows = +pair.val

  next()
  loop
    switch pair.id
      when 0
        switch pair.val
          when 'EOF'
            done = true
            break
          when 'BLOCK'
            startBlock()
            continue
          when 'ENDBLK'
            thisVertex = vertices[0]
          when 'INSERT'
            newEdge()
            continue
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
          when 'SPLINE'
            spline()
            continue
    if done
      break
    next()

  addEdges vertices
  dfs root = vertices[0]
  reorder root.paths

addEdges = (vertices)->
  byName = {}
  for v in vertices when v.name
    byName[v.name] ?= v
  for v in vertices
    for edge in v.edges when toV = byName[edge.name]
      edge.vertex = toV
  return

