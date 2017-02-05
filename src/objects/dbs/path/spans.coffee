###
Iterator over path's spans
###
module.exports = (path)->
  i = 0
  ->
    if i >= path.length
      return
    j = i++
    a: point path[j]    # Start of span
    b: path[0][2]       # Bulge
    z: point path[i]    # End of span

point = (node)->
  node.slice 0, 2
