###
Radius of span's arc
###
vector = require './vector'

module.exports = (span)->
  Math.abs(1 / span.b + span.b) / 4 * dbs.point.abs vector span
