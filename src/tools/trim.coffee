###
Trim string
###
module.exports = (s)->
  s.replace /^\s+|\s+$/g, ''
