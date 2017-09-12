options = getopt require './options'
params = options argv

if params.h or !(params.length == 1 or params.s)
  echo """
    Usage: #{argv0.bn()} [options] path/to/file.json

    Options:
  """
  options()
  exit()

if params.s
  params[0] = '-'
  json = wsh.StdIn.ReadAll()
else
  echo "Reading", params[0]
  json = file params[0]
  .load()

json = json2 json

dst = params[0]
if params.o
  dst = if (at = folder params.o).y()
    file at, file(dst).bn()
  else
    params.o
dst = file dst + '.dbs'
  .abs()
if not params.f and dst.y()
  echo "Skipping:", dst
  exit 1
echo "Writing:", dst
dbs.save json, dst
