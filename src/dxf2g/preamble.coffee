###
General parameters
###
module.exports = (paths, id='?')->
  R = dbs.part.bounds
    partid: "None"
    paths: paths

  total = 0
  for path in paths
    total += path.length - 1

  txt = """
  #{id}
  STEEL
  1.0
  #{Math.ceil 2 * Math.max R[0][1], R[1][1]}
  #{Math.ceil Math.abs R[1][0] - R[0][0]}
  0
  #{total}

  """
  for i in [1..total]
    txt += "0,,,,,,,,,,,,\n"
  txt
