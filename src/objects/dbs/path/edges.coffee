###
Return list of edges (build graph)
###
spans = require './spans'

module.exports = (path)->
  spans path, [], (span, i, edges)->
    if 1 > Math.abs span.b
      edges
      .concat
        a: span.a.slice 0, 2
        z: span.z.slice 0, 2
    else
      # Split large arc in the middle
      edges
      .concat
        a: span.a.slice 0, 2
        z: top = dbs.span.point span, 0
      .concat
        a: top
        z: span.z.slice 0, 2
