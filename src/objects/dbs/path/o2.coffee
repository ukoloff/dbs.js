###
Apply transformation to path
###
module.exports = (path, o2)->
  for node in path
    dbs.node.o2 node, o2
