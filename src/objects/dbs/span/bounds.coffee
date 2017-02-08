###
Bounds of span
###
vector = require './vector'
radius = require './radius'
center = require './center'

module.exports = (span)->
  bounds = dbs.rect.add dbs.point.bounds(span.a), span.z
  unless span.b
    return bounds
  s = vector span
  s = [s, [-s[0], -s[1]]]
  c = [1, span.b]
  c = dbs.point.mul c, c
  c = [dbs.point.conj(c), c]
  out = 0
  for cc, i in c by -1
    c[i] = dbs.point.mul cc, s[i]
  for i in [0..3]
    sf = s[i >> 1][i1 = i & 1]
    cf = c[i >> 1][i1]
    if cf > 0 and sf <= 0
      # Adjust max, i.e. bounds[1]
      out |= 4 << i1
    else if cf < 0 and sf >= 0
      # Adjust min, i.e. bounds[0]
      out |= 1 << i1
  unless out
    return bounds
  r = radius span
  c = center span
  for i in [0..3]
    if out & 1
      bounds[i >> 1][i & 1] = c[i & 1] - r
    unless out >>= 1
      break
    if 1 == i
      r = -r
  bounds
