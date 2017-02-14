###
Iterate over path's spans (with reduce)
###
module.exports = (path)->
  [fn, accumulator] = each.$ arguments
  i = 0
  while path.length > i + 1
    accumulator = fn
      a: point path[i]      # Start of span
      b: path[i][2]         # Bulge
      z: point path[i + 1]  # End of span
      i
      accumulator
    i++
  accumulator

point = (node)->
  node.slice 0, 2
