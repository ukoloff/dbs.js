###
Nesting ratio (with corrected path orientation)
###
module.exports = (file)->
  list = 0
  others = 0
  for part, i in file by -1
    area = dbs.part.area.fixed part
    if i
      others += area
    else
      list += area
  others / list
