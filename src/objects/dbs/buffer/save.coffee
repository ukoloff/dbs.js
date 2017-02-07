###
Save buffer to file
###
module.exports = (buffer, name)->
  s = ''
  for b in buffer
    s += (0x100 + b).toString(16).slice -2
  stream = binstream()
  stream.Write hex.dec s
  stream.SaveToFile name
  return
