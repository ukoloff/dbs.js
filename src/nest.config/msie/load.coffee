###
Load parameters from config file
###
storage = require './storage'

for k, v of require './defaults'
  exports[k] = v
