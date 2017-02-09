###
Create new binary buffer
###
module.exports = (size)->
  buffer = []
  buffer._ = 0
  while size
    buffer[--size] = 0
  buffer
