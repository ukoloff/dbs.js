###
Command line parser
###
module.exports = (definitions)->
  shorts = {}
  longs = {}

  # Build indexes
  for k, v of definitions
    option =
      help: v
    if /^=/.test v
      option =
        help: v.replace /.\s*/, ''
        val: true
    shorts[k.charAt 0] = longs[k] = option

  key = (k)->
    if longs[k].val
      k + '[=?]'
    else
      k

  help = ->
    len = 0
    for k of longs
      len = Math.max len, (key k).length
    for k, v of longs
      k = key k
      while k.length < len
        k += ' '
      echo "  -#{k.charAt 0}  --#{k} #{v.help}"
    echo "\nSee", PACKAGE.homepage
    return

  # Return parser
  (args)->
    unless args
      help()
      return
    args = args.slice()
    result = []

    nextArg = ->
      result[c] = args.shift() ? true

    flagArg = ->
      result[c] ||= 0
      result[c]++

    while args.length
      if '--' == arg = args.shift()
        result.push.apply result, args
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
          result[c] = val
        else if opt.val
          do nextArg
        else
          do flagArg
      else if /^-\w/.test arg
        arg = arg.substring 1
        while arg.length
          unless opt = shorts[c = arg.charAt(0).toLowerCase()]
            throw Error "Unknown option: -#{c}"
          arg = arg.substring 1
          if opt.val
            if arg
              result[c] = arg
            else
              do nextArg
            break
          do flagArg
      else
        result.push arg
    result
