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
  return
