###
Output as SVG
###
radius = require './radius'
zenith = require './zenith'

module.exports = (span, first)->
  svg = ''
  if first
    svg = "M #{span.a.join ' '}\n"
  unless span.b
    if span.a[0] == span.z[0]
      svg += "V #{span.z[1]}"
    else if span.a[1] == span.z[1]
      svg += "H #{span.z[0]}"
    else
      svg += "L #{span.z.join " "}"
    return svg
  ends = [span.z]
  if 1 <= Math.abs span.b
    ends.unshift zenith span
  r = radius span
  for z, i in ends
    if i
      svg += ' '
    svg += "A #{r} #{r} 0 0 #{Number span.b > 0} #{z.join ' '}"
  svg
