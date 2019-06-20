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
parser = require './parser'
part = parser source.open 1
part.partid = source.n()
res = [part]
echo dbs.json res, true
