###
Append buffer to the end
###
module.exports = (buffer, tail)->
  buffer.push.apply buffer, tail
  return
