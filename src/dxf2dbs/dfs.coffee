###
Deep First Traversal for BLOCK's DAG
###
configSpline = require './config'
  .spline

module.exports = dfs = (vertex)->
  if vertex.processing
    return
  vertex.paths = vertex.closed.concat vertex.nonClosed

  for spline in vertex.splines
    if 'function' == typeof (spln = configSpline)
      spln = spln spline
    unless spln
      throw SyntaxError "SPLINE found!"
    controls = spline.controls
    vertex.paths.push [controls[0].concat(0), controls[controls.length - 1].concat(0)]

  vertex.processing = true
  for edge in vertex.edges when (v2 = edge.vertex) and not v2.processing
    dfs v2
    transform = dbs.o2.translation edge.origin
    for path in v2.paths
      vertex.paths.push dbs.path.o2 path, transform
  vertex.processing = false

  transform = dbs.o2.translation vertex.base
  for path, i in vertex.paths
    vertex.paths[i] = dbs.path.o2 path, transform

  vertex
