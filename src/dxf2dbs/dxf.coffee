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
dxf = file params[0]
  .open 1

parser = require './parser'
parser dxf
