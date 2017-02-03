###
Duplicate rectange
###
module.exports = (rect)->
  unless rect
    return
  for p in rect
    p.slice()
