###
Detect Axis / Axes
###
module.exports = (paths)->
  axDir = -1
  axPos = 0
  axLen = 0
  axCnt = 0
  axW = 0

  contours = []
  for path in paths
    if dbs.path.closed path
      contours.push path
      continue
    ax = isAxis path
    if ax < 0
      continue
    # New Axis found
    axCnt++
    len =  path.length
    width = Math.abs(path[0][1-ax] - path[path.length-1][1-ax])
    if len > axLen or width > axW
      axDir = ax
      axLen = len
      axPos = path[0][ax]
      axW = width

    if len <= 2
      continue
    close path
    contours.push path

  if axCnt == 0
    echo "Axis not found. Preserving coordinates..."
    return contours

  if axCnt > 1
    echo "Axes found:", axCnt,

  echo "Using Axis:", "ZX".charAt(axDir), "=", axPos

  if axDir == 0
    rotateCW contours
    axPos = - axPos
  shift contours, axPos

  contours

isAxis = (path)->
  A = path[0]
  Z = path[path.length - 1]
  for ax in [0..1]
    if 1e-3 > Math.abs A[ax] - Z[ax]
      return ax
  return

close = (path)->
  path[path.length - 1] = 0
  path.push path[0].slice(0, 2).concat 0
  return

rotateCW = (paths)->
  for path in paths
    for pt in path
      x = pt[0]
      pt[0] = pt[1]
      pt[1] = -x
  return

shift = (paths, dy)->
  for path in paths
    for pt in path
      pt[1] -= dy
  return

