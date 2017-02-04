###
Add folder content to source

Source must contain multiline (triple #) comment only
###
fs = require "fs"
path = require "path"

module.exports = (src)->
  unless only3 src
    return src

  unless isDir folder = path.join @context, name = fname @resourcePath
    return src

  src += """

  ### glob(*) below:
  ###
  module.exports =

  """

  for f in fs.readdirSync folder
    f = fname f
    src += "#{f}: -> require './#{name}/#{f}'\n"
  src

only3 = (src)->
  lines = src
  .replace /^\s+|\s+$/g, ''
  .split /\r\n?|\n/
  unless /^#{3}/.test lines.shift()
    return
  return '###' == lines.pop()

fname = (name)->
  path.parse name
    .name

isDir = (folder)->
  try
    return fs.statSync folder
      .isDirectory()
