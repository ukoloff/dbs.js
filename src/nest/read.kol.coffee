###
Read Job in .kol format
###
readDBS = require './read.dbs'

module.exports = (f)->
  unless f.y()
    throw Error "File <#{f.bn()}> not found!"

  echo 'Reading:', f

  for s in f.lines true
    z = splitZ s, 2
    path: path = file z[0] + '.dbs'
    geo: readDBS path
    count: Number z[1]
    list: /^0*$/.test z[2]

splitZ = (s, n)->
  res = []
  while n--
    s = s.replace /\s+(\S+)$/, ''
    res.unshift RegExp.$1
  res.unshift s
  res
