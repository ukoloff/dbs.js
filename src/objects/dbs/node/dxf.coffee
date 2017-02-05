###
Output to DXF
###
module.exports = (node)->
  s = """
      0
    VERTEX
     10
    #{node[0]}
     20
    #{node[1]}
  """
  if node[2]
    s += """

       42
      #{node[2]}
    """
  """
    #{s}
      8
    0

  """
