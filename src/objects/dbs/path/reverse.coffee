###
Get reversed path
###
module.exports = (path)->
  for node, i in path by -1
    node.slice 0, 2
    .concat if i
      -path[i - 1][2]
    else
      0
