###
Save buffer to file
###
module.exports = (buffer, name)->
  s = ''
  for b in buffer
    s += hex2 b
  stream = binstream()
  stream.Write hex.dec s
  stream.SaveToFile name
  return

hex2 = (byte)->
  s = byte.toString 16
  while s.length < 2
    s = '0' + s
  s.slice -2
