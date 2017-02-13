###
Save Job for manual nesting
###
params = require './params'

dirname = file params[0]
basename = dirname.n()
dirname = dirname.up()

if params.o?
  if 'string' != typeof dirname = params.o
    dirname = '.'

dirname = folder dirname, basename
  .abs()

if !params.f and dirname.y()
  echo "Folder exists:", dirname

dirname.mk true

dbs.nf.write params.job, dirname

echo """
Nesting Job saved to: #{dirname}

Launch CatUI, nest it, then run

#{argv0.bn()} "#{dirname}"

"""
