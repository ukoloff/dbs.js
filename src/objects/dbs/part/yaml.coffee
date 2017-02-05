###
Format as YAML
###
quote = require './json'
  .q

module.exports = (part)->
  s = "  partid: #{quote part.partid}\n  paths: # #{part.length}\n"
  for path in part.paths
    s += dbs.path.yaml path
  s
