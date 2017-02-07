###
Area of span sector
###
vector = require './vector'

square = (x)-> x * x

module.exports = (span)->
  s = (span.z[0] * span.a[1] - span.z[1] * span.a[0]) / 2
  if span.b
    b2 = square span.b
    s -=
      (
        Math.atan(span.b) * square(1 + b2) - (1 - b2) * span.b
      ) / b2 / 8 * dbs.point.abs2 vector span
  s
