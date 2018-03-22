#
# Read XML & convert to JSON
#
module.exports = (name)->
  parser = activeX "Msxml2.DOMDocument"
  parser.async = false

  parser.load 'tflex.xml'

  # echo "code =", parser.parseError.errorCode
  if parser.parseError.errorCode
    throw Error "XML Error: #{parser.parseError.errorCode}"

  # echo parser.xml

  node parser.documentElement

node = (xmlNode)->
  if 3 == xmlNode.nodeType
    return xmlNode.text

  attr = {}
  each xmlNode.attributes, (A)->
    attr[A.name] = A.value

  children = []
  if xmlNode.childNodes.length
    each xmlNode.childNodes, (child)->
      children.push node child

  name: xmlNode.nodeName
  base: xmlNode.baseName
  attr: attr
  children: children

