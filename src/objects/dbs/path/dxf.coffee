###
Output to DXF
###
closed = require './closed'

module.exports = (path)->
  s = """
      0
    POLYLINE
     10
    0.0
     20
    0.0
     30
    0.0
      8
    0
     66
    1

  """
  if closed path
    path = path.slice 0, -1
    s += """
       70
      1

    """
  for node in path
    s += dbs.node.dxf node
  s + """
      0
    SEQEND

  """
