###
Deep First Traversal for BLOCK's DAG
###
joiner = require './joiner'
config = require './config'

module.exports = dfs = (vertex)->
  vertex.paths = []
  paths = vertex.closed.concat joiner vertex.nonClosed.concat processSplines vertex.splines

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

  return

processSplines = (splines)->
  for spline in splines
    if 'function' == typeof (spln = config.spline)
      spln = spln spline
    unless spln
      throw Error "SPLINE found!"
    controls = spline.controls
    [controls[0].concat(0), controls[controls.length - 1].concat(0)]
