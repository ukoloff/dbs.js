###
Check that path is closed
###
module.exports = (path)->
  if path.length < 2
    return
  dbs.point.eq path[0], path[path.length - 1]
