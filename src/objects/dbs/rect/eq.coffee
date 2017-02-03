###
Compare two rectangles
###
module.exports = (a, b)->
  unless a and b
    return
  dbs.point.eq(a[0], b[0]) and dbs.point.eq(a[1], b[1])
