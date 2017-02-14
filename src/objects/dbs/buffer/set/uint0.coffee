###
Write unsigned int and skip next one
###
u = require './uint'

module.exports = (buffer, uint, size = 2)->
  u buffer, uint, size
  buffer._ += size
  return
