###
Entry point
###
options = getopt require './options'
params = options argv

if params.h or params.length != 1
  echo """
    Usage: #{argv0.bn()} [options] path/to/jobname.kol

    Options:
  """
  options()
  exit()

dbs.kol.counts job = dbs.kol.load kolfile = file params[0]

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
  postfix = file "#{kolfile.n()}#{postfix}.dbs"
    .abs()
  echo "- #{postfix}"
  dbs.save z, postfix
