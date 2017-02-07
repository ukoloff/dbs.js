###
Read unsigned int
###
get = require '.'

module.exports = (buffer, size = 2)->
  i = 0
  for z in get buffer, size by -1
    i = z + i * 256
  i
