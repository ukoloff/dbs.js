###
Counterpart of zenith
###
linear = require './linear'

module.exports = (span)->
  linear span, [0, 1 / span.b]
