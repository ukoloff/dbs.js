###
Find perimeter
###
spans = require './spans'

module.exports = (path)->
  p = 0
  spans path, 0, (span, i, p)->
    p + dbs.span.perimeter span
