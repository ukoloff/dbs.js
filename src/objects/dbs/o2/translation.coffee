###
Translation transform
###
module.exports = (point)->
  res = do require './merge'
  res[2] = point.slice 0, 2
  res
