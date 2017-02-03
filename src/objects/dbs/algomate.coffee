###
Algomate's Nesting Factory Job item
###
module.exports = (file)->
  s = ""
  for part in file
    s += dbs.part.algomate part
  s
