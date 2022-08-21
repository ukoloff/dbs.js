###
Ensure upper side (X >= 0)
###
mirror = require './mirror'

module.exports = (paths)->
  R = dbs.part.bounds
    partid: "None"
    paths: paths

  if R[0][1] + R[1][1] < 0
    mirror paths, 1

  for path in paths
    for pt in path
      pt[0] -= R[0][0] # Or: R[1][0] for right alignment

  return
