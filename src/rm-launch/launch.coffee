###
Entry point
###

options = getopt require './options'
params = options argv

if params.h or params.length != 1
  echo """
    Usage: #{argv0.bn()} [options] path/to/file.dbs

    Options:
  """
  options()
  exit()

if params.l
  if 'number' == typeof params.l
    params.l = "%TEMP%/#{argv0.n()}.log"
  params.l = sh.ExpandEnvironmentStrings params.l

  log = fso.OpenTextFile params.l, 8, true
  log.WriteLine """

      #{argv0.n()} started: #{new Date}
      Arguments: #{argv.join ' '}
    """
  log.Close()

  sh.Run """
    "#{argv0}" #{params[0]} >>#{params.l} 2>&1
  """, 0, false
  exit()

echo "Loading:", params[0]
echo "Full path:", file(params[0]).abs()
z = dbs.load params[0]

echo "Found:", z.length, 'part(s)'
echo "Exporting:", out = file params[0] + '.json'
out.save dbs.json z, true

findBin = (bin)->
  echo 'Looking for:', bin
  top = folder '.'
  seen = {}
  until seen[top = top.abs()]
    seen[top] = true
    if (exe = file top, bin).y()
      return exe
    top = top.up()
  throw Error "Not found!"

bin = findBin 'RouteManager.exe'
echo "Found:", bin

echo "Running:", bin.bn(), out.bn()

sh.Run """
  "#{bin}" "#{out}
""", 1, false
