###
Load results of nesting and save DBS
###
params = require './params'
save = require './save'

if !(f = folder params.r).y()
  echo "Not a folder:", f.abs()
  exit()

save dbs.nf.parse f
