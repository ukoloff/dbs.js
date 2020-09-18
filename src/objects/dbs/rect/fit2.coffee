###
Build transformation to fit rectangle into square
###
module.exports = (rect, size)->
  unless rect
    return
  ratio = size / Math.max.apply Math, dbs.point.sub rect[1], rect[0]
  [[ratio, 0], [0, ratio], dbs.point.mul rect[0], -ratio]
