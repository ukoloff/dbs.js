###
Entry point
###
if 1 != argv.length
  throw SyntaxError "Usage: #{argv0.bn()} path/to/jobname.kol"

unless (job = file argv[0]).y()
  throw Error "File <#{job.bn()}> not found!"

echo "Hello from #{PACKAGE.name} v#{PACKAGE.version}"
