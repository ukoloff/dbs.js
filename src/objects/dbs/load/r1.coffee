###
Parse Record #1: Original path
###
r2 = require './r2'

module.exports = (rec)->
  reader = rec.$
  path = r2 rec
  path.orig = rec.n   # This path is original for itself
  n = Math.floor rec._ / 12
  reader.origs[rec.n] = while n--
    for i in [1..3]
      dbs.buffer.get.float reader
