###
Stream for BLOBs
###
module.exports = (text)->
  stream = activeX "ADODB.Stream"
  stream.Type = if text
    2   # adTypeText
  else
    1	# adTypeBinary
  stream.Open()
  stream
