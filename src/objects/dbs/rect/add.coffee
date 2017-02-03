###
Add point to rectandle
###
bounds = require './bounds'

module.exports = (rect, point)->
  unless rect
    return dbs.point.bounds point
  rect = bounds rect
  if rect[0][0] > point[0]
    rect[0][0] = point[0]
  if rect[0][1] > point[1]
    rect[0][1] = point[1]
  if rect[1][0] < point[0]
    rect[1][0] = point[0]
  if rect[1][1] < point[1]
    rect[1][1] = point[1]
  rect
