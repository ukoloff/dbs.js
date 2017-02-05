###
Find area
###
module.exports = (part)->
  s = 0
  for path in part.paths by -1
    s += dbs.path.area path
  s
