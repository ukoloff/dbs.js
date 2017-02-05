###
Point on the arc with more uniform distribution
###
point = require './point'

sqr = (x) -> x * x

module.exports = (span, index)->
  q = (Math.sqrt(9 + 8 * sqr span.b) + 1) / 4
  point span, index / (q - (q - 1) * sqr index)
