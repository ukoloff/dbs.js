###
Find point's position on the arc (reverse of point() method)
###
module.exports = (span, point)->
  a = dbs.point.abs dbs.point.sub point, span.a
  z = dbs.point.abs dbs.point.sub point, span.z
  (a - z) / (a + z)
