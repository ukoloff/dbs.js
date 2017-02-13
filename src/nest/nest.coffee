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

if params.m
  require './manual'
else
  require './launch'
