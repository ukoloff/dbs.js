###
Save nesting parameters to a file
###
module.exports = (file)->
  s = "# Nesting configuration\n\n"
  for k, v of require '.'
    s += "#{k}=#{v}\n"
  file.save s
