###
Load buffer from file
###
module.exports = (name)->
  stream = binstream()
  stream.LoadFromFile name
  buffer = chunk hex.enc stream.Read()
  buffer._ = 0
  buffer

# split by 2 chars
chunk = (str)->
  i = 0
  while i < str.length
    j = i
    parseInt str.substring(j, i += 2), 16
