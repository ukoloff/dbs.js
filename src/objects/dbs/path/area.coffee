###
Find area
###
closed = require './closed'
spans = require './spans'

module.exports = (path)->
  unless closed path
    return 0
  s = 0
  all = spans path
  while span = all()
    s += dbs.span.area span
  s
