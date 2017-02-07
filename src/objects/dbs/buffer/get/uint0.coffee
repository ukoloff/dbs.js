###
Read an unsigned int & skip next one
###
uint = require './uint'

module.exports = (buffer, size = 2)->
  i = uint buffer
  buffer._ += size
  i
