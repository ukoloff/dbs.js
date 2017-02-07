###
Read short (4 byte) float
###
ieee754 = require 'ieee754'
get = require '.'

module.exports = (buffer)->
  ieee754.read get(buffer, 4), 0, true, 23, 4
