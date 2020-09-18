###
Parse Record #26: Part name
###
part = require './part'

module.exports = (rec)->
  chars = dbs.buffer.get rec.$, rec._
  for c, i in chars when i & 1
    chars[i] = chars[i - 1]
    chars[i - 1] = c
  part(rec).partid = String.fromCharCode.apply String, chars
    .replace /\0/g, ' '
    .replace /^\s+|\s+$/g, ''
  return
