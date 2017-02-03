###
Algomate's Nesting Factory Job item
###
module.exports = (part)->
  s = ""
  for path in part.paths
    s += dbs.path.algomate path
  s
