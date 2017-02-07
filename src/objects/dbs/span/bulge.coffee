###
Find bulge for point
###
module.exports = bulge = (span, point)->
  tgq dbs.point.mul dbs.point.conj(dbs.point.sub point, span.a),
    dbs.point.sub span.z, point

bulge.right = right = (span, index)->
  tgq dbs.point.mul [1, span.b], [1, -index * span.b]

bulge.left = (span, index)->
  right span, -index

# Helper function: tan(arg(sqrt(pt)))
tgq = (vector)->
  if vector[0] < 0
    (dbs.point.abs(vector) - vector[0]) / vector[1]
  else
    vector[1] / (dbs.point.abs(vector) + vector[0])
