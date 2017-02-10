###
Reverse all parts
###
module.exports = (file)->
  for part in file
    dbs.part.reverse part
