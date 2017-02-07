###
Parse Record #2: Copy of path
###
module.exports = (rec)->
  reader = rec.$
  reader._ += 16  # Skip: subType, isText, isAuto, group
  reader.paths[rec.n] =
    orig: dbs.buffer.get.uint0 reader # Number of original path
    rev:  dbs.buffer.get.uint0 reader # Reverse bit
    o2:
      for i in [1..3]
        for j in [1..2]
          dbs.buffer.get.float reader
