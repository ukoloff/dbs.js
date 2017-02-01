###
Create temporary folder for Nesting Factory job
###
tmp = folder sh.ExpandEnvironmentStrings '%TMP%'

rnd = (n)->
  r = ''
  while r.length < n
    r += String.fromCharCode Math.floor 10 * Math.random() + '0'.charCodeAt 0
  r

module.exports = ->
  n = 16
  while n--
    f = folder tmp, rnd 6
    echo ">>>", f
    unless f.y()
      return f.mk()
  throw Error "Cannot create temporary folder!"
