#
# XML Builder
#
htmlEntities =
  '&': '&amp;'
  '<': '&lt;'
  '>': '&gt;'
  '"': '&quot;'

htmlize = (s)->
  "#{s}".replace /[&<>"]/g, (e)->
    htmlEntities[e]

spaces = (n)->
  result = ''
  pow = ' '
  loop
    if n & 1
      result += pow
      n--
    unless n
      return result
    n >>= 1
    pow += pow

attributes = (rec, prefix = '')->
  result = ''
  for k, v of rec when v? and false != v
    result += if 'object' == typeof v
      attributes v, "#{prefix}#{k}:"
    else
      """ #{htmlize prefix + k}="#{htmlize v}"#{}"""
  result

module.exports = (pretty=true)->
  result = "<?xml#{attributes version: '1.0'}?>"
  margin = if pretty then "\n" else ""
  if 'string' != typeof pretty
    pretty = if 'number' == typeof pretty
      spaces pretty
    else if pretty
      '  '
    else
      ''
  tags = 0

  xml: -> result
  tag: (name, attrs)->
    tags++
    children = [].slice.call arguments, 1
    result += "#{margin}<#{htmlize name}"

    if 'object' == typeof attrs
      result += attributes attrs
      children.shift()

    unless children.length
      result += "/>"
      return

    result += ">"

    saveTags = tags
    saveMargin = margin
    margin += pretty

    try
      for c in children when c?
        if 'function' == typeof c
          do c
        else
          result += htmlize c
    finally
      margin = saveMargin
      if pretty and saveTags != tags
        result += margin
      result += "</#{htmlize name}>"

    return
