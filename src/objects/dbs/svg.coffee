###
Output as SVG
###
bounds = require './bounds'

module.exports = (file, defs)->
  b = bounds file
  b = dbs.rect.expand b, 1.01
  b = [b[0][0], -b[1][1]].concat dbs.rect.size b
  svg = ''
  for part in file
    if svg
      svg += '\n'
    svg += dbs.part.svg part
  """
  <svg
    xmlns="http://www.w3.org/2000/svg"
    viewBox="#{b.join ' '}"><g><g transform = "scale(1, -1)">#{defs or ''}
  #{svg}
  </g></g></svg>
  """
