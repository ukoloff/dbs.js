###
Apply transformation to DBS
###
module.exports = (file, o2)->
  for part in file
    dbs.part.o2 part, o2
