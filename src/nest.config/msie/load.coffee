###
Load parameters from config file
###

for k, v of require './defaults'
  exports[k] = v

config = file argv0.up(), argv0.n()
echo 'CONFIG', config
