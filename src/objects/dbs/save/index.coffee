###
Save DBS to file
###
part = require './part'
eof = require './eof'

module.exports = (file, name)->
  writer = dbs.buffer.alloc 0
  writer.seq = 0
  for p in file
    part writer, p
  eof writer
  dbs.buffer.save writer, name
  return
