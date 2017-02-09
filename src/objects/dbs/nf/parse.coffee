###
Parse nesting results
###
nres = require './nres'
trace = require './trace'

module.exports = (job)->
  lines =
  file job, 'nest.indx'
  .lines true

  n = Number lines.shift()
  while n-- when line = lines.shift()
    if (tfile = file job, file(line).n() + '.trace').y()
      trace tfile
    else
      nres file job, line
