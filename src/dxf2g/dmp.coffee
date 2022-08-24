###
Dump list of Paths
###

module.exports = (paths)->
  s = ''
  for path in paths
    s += dbs.path.yaml path
  echo s

