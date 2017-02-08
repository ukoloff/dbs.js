###
Output as SVG
###
closed = require './closed'
spans = require './spans'

module.exports = (path)->
  svg = spans path, '', (span, n, svg)->
    if n
      svg += '\n'
    svg += dbs.span.svg span, !n
  if closed path
    svg += ' Z'
  svg
