###
Length of span
###
vector = require './vector'

module.exports = (span)->
  len = dbs.point.abs vector span
  if span.b
    len *= (Math.atan(span.b) / span.b) * (1 + span.b * span.b)
  len
