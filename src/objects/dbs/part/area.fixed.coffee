###
Find area
Force correct path(s) orientation (+ for outer, - for inners)
###
module.exports = (part)->
  s = 0
  for path, i in part.paths by -1
    s += negate i, Math.abs dbs.path.area path
  s

negate = (minus, value)->
  if minus
    -value
  else
    value
