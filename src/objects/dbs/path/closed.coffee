###
Check that path is closed
###
module.exports = (path)->
  if path.length < 2
    return
  a = path[0]
  z = path[path.length - 1]
  return a[0] == z[0] and a[1] == z[1]
