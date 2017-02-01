###
Entry point
###
if 1 != argv.length
  throw SyntaxError "Usage: #{argv0.bn()} path/to/jobname.kol"

kol = require './read.kol'
counts = require './counts'

counts job = kol file argv[0]
