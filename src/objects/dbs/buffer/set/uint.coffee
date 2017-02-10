###
Write unsigned int
###
set = require '.'

module.exports = (buffer, uint, size = 2)->
  uint >>>= 0
  i = set buffer, size
  while size--
    buffer[i++] = uint & 0xFF
    uint >>>= 8
  return
