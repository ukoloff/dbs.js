###
Generate G-code
###
module.exports = (paths)->
  G = ''
  for path in paths
    for pt, i in path
      mode = if i == 0
        0
      else if prev[2] == 0
        1
      else if prev[2] > 0
        3
      else
        2
      G += "G#{mode}#{pt2g pt}"
      if prev and prev[2] != 0
        c = dbs.span.center
          a: prev
          b: prev[2]
          z: pt
        c = dbs.point.sub c, prev
        G += "I#{round c[1]}K#{round c[0]}"
      G += "\n"
      prev = pt
  G

pt2g = (point)->
  "X#{round point[1]}Z#{round point[0]}"

round = (x)->
  Math.round(x * 1000) / 1000
