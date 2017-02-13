###
Write DBS
###
params = require './params'

module.exports = (result)->
  echo "Writing results..."

  dirname = folder params.r or params[0]
  basename = dirname.n()
  unless dirname.y()
    dirname = dirname.up()

  if params.o
    unless (dirname = folder params.o).y()
      echo "Not a folder:", dirname.abs()
      exit()

  for z, i in result
    postfix = ''
    if result.length > 1
      postfix = "#{i + 1}"
      while postfix.length < "#{result.length}".length
        postfix = '0' + postfix
      postfix = '.' + postfix
    postfix = file dirname, "#{basename}#{postfix}.dbs"
      .abs()
    if !params.f and postfix.y()
      echo "Skipping existing:", postfix
      continue
    echo "-", postfix
    dbs.save z, postfix
  return
