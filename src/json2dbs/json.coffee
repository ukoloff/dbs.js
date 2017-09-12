options = getopt require './options'
params = options argv

if params.h or !(params.length == 1 or params.s)
  echo """
    Usage: #{argv0.bn()} [options] path/to/file.json

    Options:
  """
  options()
  exit()
