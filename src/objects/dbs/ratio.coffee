###
Nesting ratio
###
module.exports = (file)->
  list = 0
  others = 0
  for part, i in file by -1
    area = dbs.part.area part
    if i
      others += area
    else
      list += area
  others / list
