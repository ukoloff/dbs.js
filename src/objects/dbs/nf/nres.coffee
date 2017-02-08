###
Parse nres-file
###
module.exports = (file)->
  lines =file.lines true
  i = 0
  n = Number.lines.shift()  # Number of parts
  while n--
    lines.shift()           # Name of part/list

    # First representation
    paths = Number lines.shift()
    while paths--
      nodes = 1 + Number lines.shift()
      while nodes--
        lines.shift()       # Skip 1st representation

    # Second representation
    paths = Number lines.shift()
    # Resulting part
    partid: if i++ then "PART#{num4 i}" else "LIST"
    paths: while paths--
      nodes = Number lines.shift()
      path = while nodes--
        nums lines.shift().split /\s+/
      close path

# sprintf %04d
num4 = (i)->
  i = i.toString()
  while i.length < 4
    i = '0' + i
  i

# Convert strings to numbers
nums = (a)->
  for z in a
    Number z

# Close path if needed
close = (path)->
  if path.length > 1 and !dbs.path.closed path
    path.push path[0].slice(0, 2).concat 0
  path
