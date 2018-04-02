###
Parse command line parameters
###
options = getopt require './options'

module.exports = params = options argv

if params.h or !params.r and params.length != 1
  echo """
    Usage:
      #{argv0.bn()} [options] path/to/jobname.kol
      #{argv0.bn()} [options] path/to/jobname.tfnesting
      #{argv0.bn()} [options] [-r] path/to/result\t// Folder with Algomate result
      #{argv0.bn()} [options] [-r] path/to/result.tfnesting

    Options:
  """
  options()
  exit()
