###
Find perimeter
###
spans = require './spans'

module.exports = (path)->
  p = 0
  all = spans path
  while span = all()
    p += dbs.span.perimeter span
  p
