###
Algomate's Nesting Factory Job item
###
closed = require './closed'

module.exports = (path)->
  if closed path
    path = path.slice 0, -1
  s = "VERTQUANT:\t#{path.length}\n"
  for node in path
    s += "VERTEX:\t#{node.join "\t"}\n"
  s
