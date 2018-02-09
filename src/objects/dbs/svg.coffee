###
Output as SVG
###
bounds = require './bounds'

module.exports = (file, defs)->
  b = bounds file
  b = [b[0][0], -b[1][1]].concat dbs.rect.size b
  svg = ''
  for part in file
    if svg
      svg += '\n'
    svg += dbs.part.svg part
  """
  <svg height="100%" width="100%" viewBox="#{b.join ' '}"><g transform = "scale(1, -1)">#{defs or ''}
  #{svg}
  </g></svg>
  """
