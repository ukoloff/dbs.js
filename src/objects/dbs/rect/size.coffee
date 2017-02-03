###
Size of rectangle
###
module.exports = (rect)->
  unless rect
    return
  [rect[1][0] - rect[0][0], rect[1][1] - rect[0][1]]
