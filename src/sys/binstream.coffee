###
Stream for BLOBs
###
module.exports = ->
  stream = activeX "ADODB.Stream"
  stream.Type = 1	 # adTypeBinary
  stream.Open()
  stream
