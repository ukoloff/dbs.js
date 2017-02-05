###
Apply transformation to part
###
module.exports = (part, o2)->
  dup = {}
  for k, v of part
    dup[k] = v
  paths = dup.paths
  for path, n in paths by -1
    paths[n] = dbs.path.o2 path, o2
  dup
