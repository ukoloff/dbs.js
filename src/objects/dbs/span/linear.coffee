###
Linear coordinate transformation:
  -1 -> a (start)
  0  -> center of line segment
  +1 -> z (end)
###
vector = require './vector'

module.exports = (span, point)->
  dbs.point.div dbs.point.add(
    span.a,
    dbs.point.add span.z,
      dbs.point.mul point, vector span), 2
