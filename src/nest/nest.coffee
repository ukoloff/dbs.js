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
echo "Parsing results"
result = dbs.nf.parse dst
result = dbs.nf.results result, job
dst.rm()

echo "Writing results..."
for z, i in result
  file "#{i}.yml"
  .save dbs.yaml z
