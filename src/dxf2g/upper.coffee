###
Ensure upper side (X >= 0)
###
mirror = require './mirror'

module.exports = (paths)->
  R = dbs.part.bounds
    partid: "None"
    paths: paths

  if R[0][1] + R[1][1] < 0
    echo "Applying X-mirror..."
    mirror paths, 1

  return
