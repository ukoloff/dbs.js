###
Middle point of arc
###
linear = require './linear'

module.exports = (span)->
  linear span, [0, -span.b]
