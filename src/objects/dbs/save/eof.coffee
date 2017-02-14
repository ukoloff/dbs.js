###
Write EOF
###
module.exports = (writer)->
  eof = dbs.buffer.alloc 4
  for i in [0..1]
    dbs.buffer.set.uint eof, -1
  dbs.buffer.append writer, eof
  return
