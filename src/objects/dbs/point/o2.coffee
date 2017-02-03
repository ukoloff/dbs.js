###
Apply transformation to point
###
module.exports = (o2, point)->
  [o2[0][0] * point[0] + o2[1][0] * point[1] + o2[2][0],
   o2[0][1] * point[0] + o2[1][1] * point[1] + o2[2][1]]
