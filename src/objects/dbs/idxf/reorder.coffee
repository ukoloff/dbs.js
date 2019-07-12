###
Put outer (max area) path first
###
module.exports = (paths)->
  for path, i in paths when dbs.path.closed path
    area = Math.abs dbs.path.area path
    if max? and maxArea > area
      continue
    max = i
    maxArea = area

  if max
    tmp = paths[0]
    paths[0] = paths[max]
    paths[max] = tmp

  for path, i in paths when dbs.path.closed path
    if !i == (0 > dbs.path.area path)
      paths[i] = dbs.path.reverse path

  paths
