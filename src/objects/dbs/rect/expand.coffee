###
Grow rectangle by factor
###
size = require './size'

module.exports = (rect, factor)->
  unless rect
    return
  s = size rect
  s = dbs.point.mul s, factor - 1
  [
    dbs.point.sub rect[0], s
    dbs.point.add rect[1], s
  ]
