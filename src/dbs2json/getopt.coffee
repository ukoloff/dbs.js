###
Parse command line
###
options = require './options'

module.exports = exports = []
shorts = {}
longs = {}

for k, v of options
  option =
    help: v
  if /^=/.test v
    option =
      help: v.replace /.\s*/, ''
      val: true
  shorts[k.charAt 0] = longs[k] = option

args = argv.slice()

nextArg = ->
  exports[c] = args.shift() ? true

flagArg = ->
  exports[c] ||= 0
  exports[c]++

while args.length
  if '--' == arg = args.shift()
    exports.push.apply exports, args
    break
  else if /^--\w/.test arg
    arg = arg.substring 2
    if valued = /=/.test arg
      arg = RegExp.leftContext
      val = RegExp.rightContext
    unless opt = longs[arg]
      throw Error "Unknown option: --#{arg}"
    c = arg.charAt 0
    if valued
      exports[c] = val
    else if opt.val
      do nextArg
    else
      do flagArg
  else if /^-\w/.test arg
    arg = arg.substring 1
    while arg.length
      unless opt = shorts[c = arg.charAt 0]
        throw Error "Unknown option: -#{c}"
      arg = arg.substring 1
      if opt.val
        if arg
          exports[c] = arg
        else
          do nextArg
        break
      do flagArg
  else
    exports.push arg

key = (k, length)->
  if longs[k].val
    k += '[=?]'
  if length
    k.length
  else
    k

exports.list = ->
  len = 0
  for k of longs
    len = Math.max len, key k, 1
  for k, v of longs
    k = key k
    while k.length < len
      k += ' '
    echo "  -#{k.charAt 0}  --#{k} #{v.help}"
  return
