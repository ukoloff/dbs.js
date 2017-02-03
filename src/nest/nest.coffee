###
Entry point
###
if 1 != argv.length
  throw Error "Usage: #{argv0.bn()} path/to/jobname.kol"

dbs.load()
dbs.kol.load()

kol = require './read.kol'
counts = require './counts'
wnf = require './write.nf'
launch = require './launch'

counts job = kol file argv[0]

echo "Creating Nestig Factory Job at:", dst = do require './tmppath'

# dst.rm()

wnf job, dst

launch dst.bn()
