###
Read nesting parameters from file
###
config = require '.'

module.exports = (file)->
  try
    for s in file.lines true
      if /^#/.test s
        continue
      unless /=/.test s
        continue
      k = RegExp.leftContext
      v = RegExp.rightContext

      unless config[k = trim k]?
        continue
      config[k] = numerize v
    return

numerize = (v)->
  v = trim v
  if /^\d+$/.test v
    Number v
  else
    v
