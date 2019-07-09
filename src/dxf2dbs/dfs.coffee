###
Deep First Traversal for BLOCK's DAG
###
module.exports = dfs = (vertex)->
  if vertex.processing
    return
  vertex.paths = vertex.closed.concat vertex.nonClosed

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
