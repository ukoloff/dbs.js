###
Entry point
###
unless argv.length in [1..2]
  echo "Usage:", argv0.bn(), "[json|JSON|yaml|dxf] path/to/file.dbs"
  exit()

args = argv.slice()
z = dbs.load args.pop()

switch c=(args.pop() or '').charAt 0
  when 'J'
    echo dbs.json z, true
  when 'y'
    echo dbs.yaml z
  when 'd'
    echo dbs.dxf z
  else
    echo dbs.json z
