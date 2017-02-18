###
Entry point
###
params = require './params'

if params.r
  require './finish'
  exit()

if params.t
  echo "WARNING: T-Flex Nesting not implemented yet :-("

# Reading KOL-file
dbs.kol.counts params.job = dbs.kol.load file params[0]

echo "Reading nesting parameters..."
dbs.nf.config.load file argv0.up(), "#{argv0.n()}.config"

if params.m
  require './manual'
else
  require './launch'
