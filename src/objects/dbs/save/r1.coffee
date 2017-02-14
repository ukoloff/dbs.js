###
Write path
###
rec = require './rec'

module.exports = (writer, group, path)->
  b = dbs.buffer.alloc 48 + 12 * path.length
  dbs.buffer.set.uint b, 1                      # subType
  b._ = 12
  dbs.buffer.set.uint0 b, group                 # Group
  dbs.buffer.set.uint0 b, me = ++writer.seq     # Original
  dbs.buffer.set.uint0 b, 0                     # Reverse
  for point in dbs.o2.merge()
    for x in point
      dbs.buffer.set.float b, x
  for point in path
    for x in point
      dbs.buffer.set.float b, x
  rec writer, 1, me, b
  return
