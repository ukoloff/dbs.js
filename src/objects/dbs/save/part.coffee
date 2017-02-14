###
Write part
###
r1 = require './r1'
r8 = require './r8'
r26 = require './r26'
r27 = require './r27'

module.exports = (writer, part)->
  me = writer.seq + part.paths.length
  i = 0
  for path, n in part.paths
    r1 writer, (if n then me else -me), path
  writer.seq = me
  r8 writer, part
  r26 writer, part
  r27 writer, part
  return
