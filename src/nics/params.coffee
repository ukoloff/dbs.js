###
Parse command line parameters
###
options = getopt require './options'

module.exports = params = options argv

if params.h or params.length > 2
  echo """
    Usage: #{argv0.bn()} [options] [id [+|-|new-name]]

    Options:
  """
  options()
  exit()
