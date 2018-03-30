###
Export for TFNesting
###
params = require './params'

output = params[0]

if params.o?
  if 'string' != typeof output = params.o
    output = '.'
  if folder(output).y()
    output = file output, file(params[0]).bn()

output = file output
  .abs()
output = file output.up(), output.n() + '.tfnesting'

if !params.f and output.y()
  echo "File exists:", output
  exit()

echo "Would save to:", output

###
dbs.nf.write params.job, dirname

echo """
Nesting Job saved to: #{dirname}

Launch CatUI, nest it, then run:

#{argv0.bn()} -r "#{dirname}"

"""
###
