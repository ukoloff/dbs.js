###
Entry point
###
getopt = require './getopt'

params = getopt.parse argv

echo dump5 params
exit()
echo 'Loading:', params._[0]
z = dbs.load params._[0]

if params.y
  echo dbs.yaml z
else if params.d
  echo dbs.dxf z
else if params.n
  echo dbs.algomate z
else if params.s
    require('./svg') z
else
  echo dbs.json z, params.p
