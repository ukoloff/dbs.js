###
Load results of nesting and save DBS
###
params = require './params'
save = require './save'

defaults = (path)->
  if 'string' != typeof path
    '.'
  else
    path

f = folder defaults params.r
  .abs()

save if f.y()
    echo "Loading Nesting Factory result:", f
    dbs.nf.parse f
  else if (file f).y()
    echo "Loading TFNesting result:", f
    dbs.tfnest.dbs dbs.tfnest.load "#{f}"
  else
    throw Error "File/folder not found: #{f}"
