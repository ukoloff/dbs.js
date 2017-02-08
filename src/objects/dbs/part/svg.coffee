###
Output as SVG
###
module.exports = (part)->
  svg = ''
  for path, n in part.paths
    if n
      svg += '\n'
    svg += dbs.path.svg path
  """
  <path name="#{part.partid}" d="#{svg}"/>
  """
