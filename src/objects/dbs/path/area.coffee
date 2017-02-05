###
Find area
###
closed = require './closed'

module.exports = (path)->
  unless closed path
    return 0
  s = 0
  spans = path.spans()
  while span = spans()
    s += dbs.span.area span
  s
