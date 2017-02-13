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

if !(f = folder defaults params.r).y()
  echo "Not a folder:", f.abs()
  exit()

save dbs.nf.parse f
