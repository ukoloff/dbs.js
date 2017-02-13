###
Parse nesting results
###
nres = require './nres'
trace = require './trace'

module.exports = (job, useTrace)->
  lines = if isUTF16 index = file job, 'nest.indx'
    stripCatUI split readUTF16 index
  else
    index.lines true

  n = Number lines.shift()
  while n-- when line = lines.shift()
    if useTrace and (tfile = file job, file(line).n() + '.trace').y()
      trace tfile
    else
      nres file job, line

isUTF16 = (name)->
  stream = binstream()
  stream.LoadFromFile name
  'fffe' == hex.enc(stream.Read 2).toLowerCase()

readUTF16 = (name)->
  stream = binstream true
  stream.LoadFromFile name
  stream.ReadText()

split = (text)->
  for s in text.split /\r\n?|\n/
    s.replace /^\s+|\s+$/g, ''

# CatUI generates:
# 1) UTF-16(LE)
# 2) Unneeded section at the start
stripCatUI = (lines)->
  lines.slice 1 + Number lines[0]
