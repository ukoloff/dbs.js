###
Return list of edges (build graph)
###
module.exports = (file, withList)->
  edges = []
  for part in file.slice(if withList or file.length < 2 then 0 else 1)
    edges = edges.concat dbs.part.edges part
  edges
