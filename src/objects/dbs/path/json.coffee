###
Format as JSON
###
module.exports = (path, pretty)->
  s = '['
  for node, i in path
    s += ',' if i
    s += '\n  ' if pretty
    s += dbs.node.json node, pretty
  s + ']'
