###
Write partid
###
rec = require './rec'

module.exports = (writer, part)->
  b = dbs.buffer.alloc 8
  for i in [0..7]
    b[i] = part.partid.charCodeAt(i ^ 1) or 32
  rec writer, 26, writer.seq, b
  return
