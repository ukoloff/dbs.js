###
Output to DXF
###
module.exports = (file)->
  s = """
      0
    SECTION
      2
    ENTITIES

  """
  for part in file
    s += dbs.part.dxf part
  s + """
      0
    ENDSEC
      0
    EOF

  """
