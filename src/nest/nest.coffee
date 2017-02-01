###
Entry point
###
if 1 != argv.length
  throw SyntaxError "Usage: #{argv0.bn()} path/to/jobname.kol"

kol = require './read.kol'
counts = require './counts'
wnf = require './write.nf'

counts job = kol file argv[0]

echo "Creating Nestig Factory Job at:", dst = do require './tmppath'

# dst.rm()

wnf job, dst
