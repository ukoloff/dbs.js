###
Parse trace-file
###
module.exports = (file)->
  bundle = {}
  for s in file.lines true when not /^#/.test s
    s = s.split /\s+/
    unless bundle.parts
      bundle.list = Number s[0]
      bundle.parts = []
      continue
    bundle.parts.push
      part: Number s[0]
      o2:   o2 nums s.slice 2
  bundle

# Convert strings to numbers
nums = (a)->
  for z in a
    Number z

# Build transformation
o2 = (a)->
  t = dbs.o2.ccw a[1]
  if a[0]
    t = dbs.o2.merge t, dbs.o2.antix()
  dbs.o2.merge dbs.o2.translation(a.slice 2), t
