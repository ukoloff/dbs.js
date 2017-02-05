###
Format as YAML
###
module.exports = (file)->
  s = ''
  for part in file
    s += "-\n#{dbs.part.yaml part}"
  s
