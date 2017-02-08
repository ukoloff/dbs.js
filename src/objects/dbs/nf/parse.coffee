###
Parse nesting results
###
trace = require './trace'

module.exports = (job)->
  lines =
  file job, 'nest.indx'
  .lines true

  n = Number lines.shift()
  while n-- when line = lines.shift()
    trace file job, file(line).n() + '.trace'
