###
Get parts (and lists) list
###
module.exports = (job)->
  nparts = nlists = 0
  parts = {}
  lists = {}
  for z in job
    if z.list
      lists[nlists++] = z
    else
      parts[nparts++] = z
  lists: lists
  parts: parts
