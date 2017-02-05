###
Apply transformation to node
###
module.exports = (node, o2)->
  if o2
    dbs.point.o2 node, o2
    .concat if 0 > dbs.o2.det o2
      -node[2]
    else
      node[2]
  else
    node.slice()
