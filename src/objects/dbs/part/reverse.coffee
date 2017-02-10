###
Reverse all paths of part
###
o2 = require './o2'

module.exports = (part)->
  paths = part.paths
  part.paths = []
  r = o2 part
  part.paths = paths
  r.paths = for path in paths
    dbs.path.reverse path
  r
