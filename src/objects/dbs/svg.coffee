###
Output as SVG
###
module.exports = (file)->
  svg = ''
  for part, n in file
    if n
      svg += '\n'
    svg += dbs.part.svg part
  svg
