###
Read DBS from file
###
parse = require './parse'

module.exports = (name)->
  parse dbs.buffer.load name
