###
Complex division
###
abs2 = require './abs2'

module.exports = self = (a, b)->
  if 'number' == typeof b
    [a[0] / b, a[1] / b]
  else
    self [a[0] * b[0] + a[1] * b[1], a[1] * b[0] - a[0] * b[1]], abs2 b
