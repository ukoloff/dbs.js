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

xml = dbs.xml()
dbs.tfnest.build.kol xml, params.job

echo "Writing:", output

output.save xml.xml()

echo "Done!"
