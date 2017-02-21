###
Write area & perimeter
###
rec = require './rec'

module.exports = (writer, part)->
  b = dbs.buffer.alloc 8
  dbs.buffer.set.float b, 1e-4 * dbs.part.area part
  dbs.buffer.set.float b, 1e-2 * dbs.part.perimeter part
  rec writer, 27, writer.seq, b
  return
