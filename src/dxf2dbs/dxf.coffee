options = getopt require './options'
params = options argv

if params.h or params.length != 1
  echo """
    Usage: #{argv0.bn()} [options] path/to/file.dxf

    Options:
  """
  options()
  exit()
