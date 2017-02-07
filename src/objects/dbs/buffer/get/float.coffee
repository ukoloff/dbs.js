###
Read short (4 byte) float
###
get = require '.'

module.exports = (buffer)->
  ieee754.read get(buffer, 4), 0, true, 23, 4
