###
Export for NCL (.kol + *.dbs)
###
params = require './params'

output = file params[0]
output = folder output.up(), output.n()

if params.o?
  if 'string' != typeof output = params.o
    output = '.'

output = folder output
  .abs()

if !params.f and output.y()
  echo "Folder exists:", output
  exit()

echo "Saving KOL to:", output
output.mk()

dbs.kol.pckg params.job, output

echo "Done!"
