###
Merge a few transformations (from right to left!)
###
module.exports = ->
  vectors = [[1, 0], [0, 1], [0, 0]]
  for z in arguments by -1 when z
    for v, i in vectors by -1
      vectors[i] = dbs.point.o2 v, z
  delta = vectors[2]
  for v, i in vectors by -1 when i != 2
    vectors[i] = dbs.point.sub v, delta
  vectors
