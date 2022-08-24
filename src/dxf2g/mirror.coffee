###
Mirror paths
###
module.exports = (paths, axis)->
  for path in paths
    for pt in path
      pt[axis] = -pt[axis]
      pt[2] = - pt[2]
