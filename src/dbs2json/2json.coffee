###
Entry point
###
params = require './getopt'
svg = require './svg'

if params.h or params.length != 1
  echo """
    Usage: #{argv0.bn()} [options] path/to/file.dbs

    Options:
  """
  params.list()
  exit()

echo 'Loading:', params[0]
z = dbs.load params[0]

out = (ext, string)->
  echo '>>>', ext
  params.J = 1
  echo string

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
