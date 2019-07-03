options = getopt require './options'
params = options argv

if params.h or params.length != 1
  echo """
    Usage: #{argv0.bn()} [options] path/to/file.dxf

    Options:
  """
  options()
  exit()

echo "Reading", params[0]
source = file params[0]

layout = require './layout'
layout source.open 1
exit 0

parser = require './parser'
part = parser source.open 1
part.partid = source.n()
res = [part]
echo dbs.json res, true

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
