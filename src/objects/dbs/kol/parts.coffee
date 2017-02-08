###
Get parts list (or lists aka domains)
###
module.exports = (job, lists)->
  z for z in job when !z.list = !lists
