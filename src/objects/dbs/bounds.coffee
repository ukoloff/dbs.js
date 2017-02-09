###
Find bounds
###
module.exports = (file)->
  for part in file by -1
    bounds = dbs.rect.union bounds, dbs.part.bounds part
  bounds
