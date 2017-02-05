###
Format as JSON
###
module.exports = (file, pretty)->
  s = '['
  for part, i in file
    s += ',' if i
    s += dbs.part.json part, pretty
  s + ']'
