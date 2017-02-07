###
Parse Record #8: List of paths
###
part = require './part'

module.exports = (rec)->
  n = rec._ >> 2  # Count of items
  part(rec).paths = while n++
    dbs.buffer.get.uint0 rec.$
