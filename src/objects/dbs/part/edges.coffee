###
Return list of edges (build graph)
###
module.exports = (part)->
  edges = []
  for path in part.paths
    edges = edges.concat dbs.path.edges path
  edges
