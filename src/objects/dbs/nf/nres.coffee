###
Parse nres-file
###
module.exports = (file)->
  lines =file.lines true
  n = Number lines.shift()  # Number of parts
  while n--
    pname = lines.shift()           # Name of part/list
    if partids
      partid = partids[pname] ||= "PART#{num4 1 + count partids}"
    else
      # First part is list
      partids = {}
      partid = 'LIST'

    # First representation
    paths = Number lines.shift()
    while paths--
      nodes = 1 + Number lines.shift()
      while nodes--
        lines.shift()       # Skip 1st representation

    # Second representation
    paths = Number lines.shift()
    # Resulting part
    partid: partid
    paths: while paths--
      nodes = Number lines.shift()
      path = while nodes--
        nums lines.shift().split /\s+/
      dbs.path.reverse close path

# sprintf %04d
num4 = (i)->
  i = i.toString()
  while i.length < 4
    i = '0' + i
  i

# count of keys
count = (rec)->
  n = 0
  for k of rec
    n++
  n

# Convert strings to numbers
nums = (a)->
  for z in a
    Number z

# Close path if needed
close = (path)->
  if path.length > 1 and !dbs.path.closed path
    path.push path[0].slice(0, 2).concat 0
  path
