###
Read next DBS record
###
kinds =
  1: require './r1'
  2: require './r2'
  8: require './r8'
  26: require './r26'

module.exports = (reader)->
  reader.origs = {}    # Original paths (Rec#1)
  reader.paths = {}    # Copies of paths (Rec#2)
  reader.parts = {}    # Parts (Rec#8 & Rec#26)
  next = 0
  loop
    reader._ = next

    len = dbs.buffer.get.uint reader
    if 0x8000 & len
      break
    reader._ += 2 # skip 2 bytes

    if len != dbs.buffer.get.uint0 reader
      throw Error 'Invalid DBS'

    # Position of next record
    next += (len + 1) * 4

    # Record type
    unless parser = kinds[dbs.buffer.get.uint0 reader]
      continue

    parser
      n: dbs.buffer.get.uint0 reader      # Record Number
      _: next - reader._                  # Size of payload
      $: reader

  # Remove scaffolding
  seenPaths = {}
  for k, part of reader.parts
    for pathNo in part.paths
      seenPaths[pathNo] = true
  unseenPaths = for k, v of reader.paths when not seenPaths[k]
    k
  if unseenPaths.length
    # Add extra Part with missing Paths
    reader.parts['-'] =
      partid: '-'
      paths: unseenPaths

  for k, part of reader.parts
    part.paths = for pathNo in part.paths
      unless path = reader.paths[pathNo]
        throw Error "Path ##{pathNo} not found!"
      unless orig = reader.origs[path.orig]
        throw Error "Original Path ##{path.orig} not found!"
      reverse path.rev, dbs.path.o2 orig, path.o2
    part

reverse = (flag, path)->
  if flag
    dbs.path.reverse path
  else
    path
