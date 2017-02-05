###
Output to DXF
###
module.exports = (part)->
  s = ''
  for path in part.paths
    s += dbs.path.dxf path
  s
