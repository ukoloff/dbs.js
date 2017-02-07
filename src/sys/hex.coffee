###
Hexadecimal Encode/Decode
###
element = activeX "Msxml2.DOMDocument"
  .createElement 'tmp'
element.dataType = "bin.hex"

exports.enc = (blob)->
  element.nodeTypedValue = blob
  res = element.text
  element.text = ''
  res

exports.dec = (str)->
  element.text = str
  res = element.nodeTypedValue
  element.text = ''
  res
