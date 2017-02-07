###
Find area
###
closed = require './closed'
spans = require './spans'

module.exports = (path)->
  unless closed path
    return 0
  spans path, 0, (span, i, s)->
    s + dbs.span.area span
