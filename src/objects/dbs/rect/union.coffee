###
Combine two rectandles
###
add = require './add'

module.exports = (a, b)->
  unless a
    return b
  unless b
    return a
  add add(a, b[0]), b[1]
