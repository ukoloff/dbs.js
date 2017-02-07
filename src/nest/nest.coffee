###
Entry point
###
if 1 != argv.length
  echo "Usage:", argv0.bn(), "path/to/jobname.kol"
  exit()

dbs.kol.counts job = dbs.kol.load file argv[0]

echo "Creating Nestig Factory Job at:", dst = dbs.nf.sandbox()

dbs.nf.write job, dst
dbs.nf.launch dst.bn()

# dst.rm()
