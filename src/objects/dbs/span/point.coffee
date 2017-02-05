###
Point on the arc
  -1 -> a (start)
  0  -> middle point
  +1 -> z (end)
###
linear = require './linear'
div = dbs.point.div

module.exports = (span, index)->
  linear span, div [index, -span.b], [1, -index * span.b]
