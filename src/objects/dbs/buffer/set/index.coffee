###
Ensure space to write to buffer
###
module.exports = (buffer, size)->
  i = buffer._
  j = buffer._ += size
  k = buffer.length
  while --j > k
    buffer[j] = 0
  i
