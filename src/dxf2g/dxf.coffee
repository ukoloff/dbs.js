###
DXF Parser for Turning Stage 1 (to G-code)
###
options = getopt require './options'

params = options argv
if params.h or params.length != 1
  echo """
    Usage: #{argv0.bn()} [options] path/to/file.dxf

    Options:
  """
  options()
  exit()

dbs.idxf.config.spline = if params.s
  true
else
  ->
    throw Error "SPLINE found! Use --spline to convert to LINE..."

echo "Reading", params[0]
source = file params[0]

paths = dbs.idxf source.open 1
