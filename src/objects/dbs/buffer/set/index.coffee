###
Ensure space to write to buffer
###
module.exports = (buffer, size)->
  i = buffer._
  if buffer.length < buffer._ += size
    throw Error "Write beyond End of File"
  i
