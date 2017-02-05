###
Point on the arc
  -1 -> a (start)
  0  -> middle point
  +1 -> z (end)
###
linear = require './linear'

module.exports = (span, index)->
  linear span, dbs.point.div [index, -span.b], [1, -index * span.b]
