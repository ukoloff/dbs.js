###
Write short (4 byte) float
###
ieee754 = require 'ieee754'
set = require '.'

module.exports = (buffer, float)->
  ieee754.write buffer, float, set(buffer, 4), true, 23, 4
  return
