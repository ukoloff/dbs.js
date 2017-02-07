###
Format as YAML
###
area = require './area'
perimeter = require './perimeter'
quote = require './json'
  .q

module.exports = (part)->
  rec =
    partid: quote part.partid
    area: area part
    perimeter: perimeter part
    paths: "# #{part.paths.length}"
  s = ''
  for k, v of rec
    s += "  #{k}: #{v}\n"
  for path in part.paths
    s += dbs.path.yaml path
  s
