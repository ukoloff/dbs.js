#
# XML Builder
#
htmlEntities =
  '&': '&amp;'
  '<': '&lt;'
  '>': '&gt;'
  '"': '&quot;'

h = (s)->
  "#{s}".replace /[&<>"]/g, (e)->
    htmlEntities[e]

spaces = (n)->
  result = ''
  while n--
    result += ' '
  result

module.exports = (pretty=true)->
  result = '<?xml version="1.0"?>'
  margin = if pretty then "\n" else ""
  tags = 0

  xml: -> result
  tag: (name, attrs)->
    tags++
    children = [].slice.call arguments, 1
    result += "#{margin}<#{h name}"

    if 'object' == typeof attrs
      children.shift()
      for k, v of attrs when v? and false != v
        result += """ #{h k}="#{h v}"#{}"""

    unless children.length
      result += "/>"
      return

    result += ">"

    saveTags = tags
    saveMargin = margin
    margin += if 'string' == typeof pretty
      pretty
    else if 'number' == typeof pretty
      spaces pretty
    else if pretty
      '  '
    else
      ''

    try
      for c in children when c?
        if 'function' == typeof c
          do c
        else
          result += h c
    finally
      margin = saveMargin
      if pretty and saveTags != tags
        result += margin
      result += "</#{h name}>"

    return
