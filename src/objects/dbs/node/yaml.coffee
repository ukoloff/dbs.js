###
Format as YAML
###
json = require './json'
module.exports = (node)->
  json node, true
