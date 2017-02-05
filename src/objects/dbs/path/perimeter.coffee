###
Find perimeter
###
module.exports = (path)->
  p = 0
  spans = path.spans()
  while span = spans()
    p += dbs.span.perimeter span
  p
