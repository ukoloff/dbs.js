###
Write arbitrary record
###
rec = require './rec'

module.exports = (writer, kind, id, payload)->
  b = dbs.buffer.alloc 16
  dbs.buffer.append b, payload
  if len = b.length & 3
    dbs.buffer.append b, dbs.buffer.alloc 4 - len

  dbs.buffer.set.uint b, len = b.length - 4 >> 2
  dbs.buffer.set.uint b, id
  dbs.buffer.set.uint0 b, len
  dbs.buffer.set.uint0 b, kind
  dbs.buffer.set.uint0 b, id

  dbs.buffer.append writer, b
  return
