###
Entry point
###
svg = require './svg'
options = getopt require './options'
params = options argv

if params.h or params.length != 1
  echo """
    Usage: #{argv0.bn()} [options] path/to/file.dbs

    Options:
  """
  options()
  exit()

unless stdout = params.o in [true, '', '-']
  echo 'Loading:', params[0]
z = dbs.load params[0]

out = (ext, string)->
  params.J = 1
  if stdout
    echo string
    return
  dst = params[0]
  if params.o
    dst = if (at = folder params.o).y()
      file at, file(dst).bn()
    else
      params.o
  dst = file dst + '.' + ext
    .abs()
  if not params.f and dst.y()
    echo "Skipping:", dst
    return
  echo "Writing:", dst
  dst.save string

if params.y
  out 'yml', dbs.yaml z
if params.d
  out 'dxf', dbs.dxf z
if params.a
  out 'item', dbs.algomate z
if params.s
  out 'html', svg z
if params.j or not params.J
  out 'json', dbs.json z, params.p
