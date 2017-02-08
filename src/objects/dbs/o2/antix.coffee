###
Mirror in the Y axis (x = -x)
###
module.exports = ->
  res = do require './merge'
  res[0][0] = -1
  res
