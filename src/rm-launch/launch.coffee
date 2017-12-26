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
echo "Full path:", fso.GetAbsolutePathName params[0]
z = dbs.load params[0]

echo "Found:", z.length, 'part(s)'
echo "Exporting:", out = params[0] + '.json'
out = fso.CreateTextFile out, true
out.WriteLine dbs.json z, true
