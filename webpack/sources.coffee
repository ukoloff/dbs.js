###
Inject some [pseudo-]local variables
###
fs = require 'fs'
path = require 'path'
ini = require '../package'

@root =
root = path.join __dirname, '../src'

@entry =
entry   = {}

@globals =
globals = {}

for f of ini.devDependencies when /^[$\w]+$/.test f
  globals[f] = f

# name of file
fname = (file)->
  path.parse file
  .name

# Add whole subtree of [pseudo]globals
tree = (prefix, folder)->
  for f in fs.readdirSync folder
    globals[pfx = "#{prefix}.#{fname f}"] = full = path.join folder, f
    if fs.statSync(full).isDirectory()
      tree pfx, full
  return

for libname in fs.readdirSync root
  continue unless fs.statSync lib = path.join root, libname
    .isDirectory()
  z = {}
  for file in fs.readdirSync lib
    if 'index' == name = fname file
      entry[libname] = lib
      z = {}
      break
    z[name] = path.join lib, file
  for k, v of z
    if fs.statSync(v).isDirectory()
      tree k, v
    globals["#{libname}.#{k}"] =
    globals[k] = v
