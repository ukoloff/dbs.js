###
Entry point
###
params = require './params'

if params.r
  require './finish'
  exit()

# Reading nesting job (.kol/.tfnesting)
source = file params[0]
  .abs()

unless source.y()
  throw Error "File not found: #{source}"

switch source.ext().toLowerCase()
  when 'kol'
    echo "Reading NCL job: #{source}"
    params.job = dbs.kol.load source
  when 'tfnesting'
    echo "Reading TFNesting job: #{source}"
    params.job = dbs.tfnest.kol dbs.tfnest.load "#{source}"
  else
    throw Error "Unsupported file extension: #{source}"

dbs.kol.counts params.job

echo "Reading nesting parameters..."
dbs.nf.config.load file argv0.up(), "#{argv0.n()}.config"

if params.t
  require './tfnest'
else if params.n
  require './ncl'
else if params.m
  require './manual'
else
  require './launch'
