###
Iterate over path's spans (with reduce)
###
module.exports = (path, value, fn)->
  if not fn? and 'function' == typeof value
    fn = value
    value = i
  i = 1
  while i < path.length
    value = fn
      a: point path[i - 1]  # Start of span
      b: path[i - 1][2]         # Bulge
      z: point path[i]      # End of span
      i - 1
      value
    i++
  value

point = (node)->
  node.slice 0, 2
