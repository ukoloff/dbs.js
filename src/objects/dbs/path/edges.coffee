###
Return list of edges (build graph)
###
spans = require './spans'

module.exports = (path)->
  spans path, [], (span, i, edges)->
    edges.concat
      a: span.a.slice 0, 2
      z: span.z.slice 0, 2
