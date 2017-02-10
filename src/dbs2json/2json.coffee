###
Entry point
###
es5
minimist = require 'minimist'

params  = minimist argv,
  boolean: true
  strings: 'output'
  alias:
    help:   ['h', '?']
    pretty: 'p'
    output: 'o'
    json:   'j'
    yaml:   ['yml', 'y']
    dxf:    'd'
    nf:     ['n', 'nesting-factory']
    svg:    's'
    force:  'f'

if params.h or 1 != params._.length
  echo """
    Usage: #{argv0.bn()} [options] path/to/file.dbs

    Options:
      --json -j   Output JSON
      --yaml -y   Output YAML
      --dxf  -d   Output DXF
      --svg  -s   Output SVG (inside HTML)
      --nesting-factory --nf -n Output for Algomate's Nesting Factory
      --pretty -p Pretty output (JSON only)
      --output=file|- -o  File (or stdout) to write output to
      --force -f  Overwrite output file if exists
  """
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
