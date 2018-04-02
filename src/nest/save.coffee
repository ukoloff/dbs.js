###
Write .dbs/.json(s) after nesting
###
params = require './params'

defaults = (path)->
  if 'string' != typeof path
    '.'
  else
    path

module.exports = (result)->
  echo "Writing results..."

  dirname = folder true != params.r and params.r or params[0]
  basename = dirname.abs().n()
  unless dirname.y()
    dirname = dirname.up()

  if params.o
    unless (dirname = folder defaults params.o).y()
      echo "Not a folder:", dirname.abs()
      exit()

  ext = '.dbs'
  if params.j
    ext += '.json'

  for z, i in result
    postfix = ''
    if result.length > 1
      postfix = "#{i + 1}"
      while postfix.length < "#{result.length}".length
        postfix = '0' + postfix
      postfix = '.' + postfix
    postfix = file dirname, "#{basename}#{postfix}#{ext}"
      .abs()
    if !params.f and postfix.y()
      echo "Skipping existing:", postfix
      continue
    echo "-", postfix
    if params.j
      postfix.save dbs.json z, true
    else
      dbs.save z, postfix

  # Dump usage coefficient(s)
  echo "\nMaterial utilisation factor(s):"
  for z, i in result
    ratio = 100 * dbs.ratio z
    ratioFixed = 100 * dbs.ratio.fixed z
    echo  "#{i+1}.\t#{ratio.toFixed 3}%#{if ratio != ratioFixed
        "\t// #{ratioFixed.toFixed 3}%"
      else
        ''
    }"

  return
