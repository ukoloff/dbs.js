###
Entry point
###
if 1 != argv.length
  throw Error "Usage: #{argv0.bn()} path/to/jobname.kol"

wnf = require './write.nf'
launch = require './launch'

dbs.kol.counts job = dbs.kol.load file argv[0]

echo "Creating Nestig Factory Job at:", dst = do require './tmppath'

# dst.rm()

wnf job, dst

launch dst.bn()
