###
Find bounds
###
spans = require './spans'

module.exports = (path)->
  spans path, (span, i, bounds)->
    dbs.rect.union bounds, dbs.span.bounds span
