###
Save user input
###
module.exports = (data)->
  s = "# Nesting configuration\n\n"
  for k, v of data
    s += "#{k}=#{v}\n"
  require './storage'
    .save s
