###
Center of arc's circle
###
linear = require './linear'

module.exports = (span)->
  linear span, [0, (1 / span.b - span.b) / 2]
