###
Find perimeter
###
module.exports = (part)->
  p = 0
  for path in part.paths by -1
    p += dbs.path.perimeter path
  p
