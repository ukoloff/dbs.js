###
Clockwise ratation (degrees)
###
module.exports = (degrees)->
  degrees *= Math.PI / 180
  cos = Math.cos degrees
  sin = Math.sin degrees
  [[cos, -sin], [sin, cos], [0, 0]]
