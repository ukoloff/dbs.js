###
Entry point
###
if 1 != argv.length
  echo "Usage:", argv0.bn(), "path/to/jobname.kol"
  exit()

dbs.kol.counts job = dbs.kol.load argv0 = file argv[0]

echo "Creating Nestig Factory Job at:", dst = dbs.nf.sandbox()

dbs.nf.write job, dst
dbs.nf.launch dst.bn()
echo "Parsing results"
result = dbs.nf.parse dst
result = dbs.nf.results result, job
dst.rm()

echo "Writing results..."
for z, i in result
  postfix = ''
  if result.length > 1
    postfix = "#{i + 1}"
    while postfix.length < "#{result.length}".length
      postfix = '0' + postfix
    postfix = '.' + postfix
  postfix = file "#{argv0.n()}#{postfix}"
    .abs()
  echo "- #{postfix}"
  dbs.save z, postfix + '.dbs'
  file postfix + '.yml'
  .save dbs.yaml z
