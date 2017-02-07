###
Iterator over path's spans
###
module.exports = (path)->
  echo 'S', path
  i = 0
  ->
    j = i
    if ++i >= path.length
      return
    a: point path[j]    # Start of span
    b: path[0][2]       # Bulge
    z: point path[i]    # End of span

point = (node)->
  node.slice 0, 2
