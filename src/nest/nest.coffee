###
Entry point
###
if 1 != argv.length
  throw SyntaxError "Usage: #{argv0.bn()} path/to/jobname.kol"

job = require('./read.kol') file argv[0]
