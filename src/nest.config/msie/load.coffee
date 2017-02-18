###
Load parameters from config file
###
storage = require './storage'

for k, v of require './defaults'
  exports[k] = v

try
  for s in storage.lines true
    if /^#/.test s
      continue
    unless /=/.test s
      continue
    k = RegExp.leftContext
    v = RegExp.rightContext

    unless exports[k = trim k]?
      continue
    exports[k] = trim v
