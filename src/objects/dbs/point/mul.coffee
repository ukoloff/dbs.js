###
Complex multiplication
###
module.exports = (a, b)->
  if 'number' == typeof b
    [a[0] * b, a[1] * b]
  else
    [a[0] * b[0] - a[1] * b[1], a[1] * b[0] + a[0] * b[1]]
