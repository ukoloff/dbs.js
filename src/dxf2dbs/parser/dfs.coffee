###
Deep First Traversal for BLOCK's DAG
###
config = require './config'

module.exports = dfs = (vertex)->
  vertex.paths = []
  paths = vertex.closed.concat vertex.nonClosed

  for spline in vertex.splines
    if 'function' == typeof (spln = config.spline)
      spln = spln spline
    unless spln
      throw Error "SPLINE found!"
    controls = spline.controls
    vertex.paths.push [controls[0].concat(0), controls[controls.length - 1].concat(0)]

  for edge in vertex.edges when v2 = edge.vertex
    unless v2.paths
      dfs v2
    transform = dbs.o2.translation edge.origin
    for path in v2.paths
      paths.push dbs.path.o2 path, transform

  transform = dbs.o2.translation vertex.base
  for path, i in paths
    paths[i] = dbs.path.o2 path, transform
  vertex.paths = paths

  vertex
