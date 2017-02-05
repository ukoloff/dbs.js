###
Linear coordinate transformation:
  -1 -> a (start)
  0  -> center of line segment
  +1 -> z (end)
###
vector = require './vector'
add = dbs.point.add
mul = dbs.point.mul
div = dbs.point.div

module.exports = (span, point)->
  div add(span.a, add span.z, mul point, vector span), 2
