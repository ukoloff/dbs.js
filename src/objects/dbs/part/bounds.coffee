###
Find bounds
###
module.exports = (part)->
  for path in part.paths by -1
    bounds = dbs.rect.union bounds, dbs.path.bounds path
  bounds
