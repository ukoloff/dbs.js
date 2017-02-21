###
Write path IDs
###
rec = require './rec'

module.exports = (writer, part)->
  b = dbs.buffer.alloc 4 * (n = part.paths.length)
  id = writer.seq - n
  while n--
    dbs.buffer.set.uint0 b, id++,
  rec writer, 8, writer.seq, b
  return
