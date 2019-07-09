options = getopt require './options'
params = options argv

if params.h or params.length != 1
  echo """
    Usage: #{argv0.bn()} [options] path/to/file.dxf

    Options:
  """
  options()
  exit()

require './config'
  .spline = if params.s
    true
  else
    ->
      throw Error "SPLINE found! Use --spline to convert to LINE..."

echo "Reading", params[0]
source = file params[0]

parser = require './parser'
part =
  paths: parser source.open 1
  partid: source.n()

res = [part]

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
dbs.save res, dst
