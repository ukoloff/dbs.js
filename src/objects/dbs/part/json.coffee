###
Format as JSON
###
module.exports = json = (part, pretty)->
  eol = space = ''
  if pretty
    eol = "\n  "
    space = " "
  s = "{#{eol}#{
    quote 'partid'}:#{space}#{quote part.partid},#{eol}#{
    quote 'paths'}:#{space}["
  for path, i in part.paths
    s += ',' if i
    s += "#{eol}#{dbs.path.json path, pretty}"
  s += '\n' if pretty
  s + ']}'

escapes =
  '\r': 'r'
  '\n': 'n'

# String to JSON
json.q = quote = (s)->
  """
  "#{"#{s}".replace /[\r\n"\\]/g, (c)->
    "\\#{escapes[c] or c}"
  }"
  """
