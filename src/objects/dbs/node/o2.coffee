###
Apply transformation to node
###
module.exports = (o2, node)->
  dbs.point.o2(o2, node).concat if 0 > dbs.o2.det o2 then -node[2] else node[2]
