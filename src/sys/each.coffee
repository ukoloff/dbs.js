###
Iterate thru OLE Collection
###
module.exports = exports = (collection)->
  [fn, accumulator] = parse arguments
  n = 0
  E = new Enumerator collection
  while !E.atEnd()
    accumulator = fn E.item(), n++, accumulator
    E.moveNext()
  accumulator

# Parse iterator arguments, finding function and initial value
exports.$ = parse = (args, start = 1)->
  i = 2
  while i--
    if 'function' == typeof fn = args[start + i]
      return [fn, args[start + 1 - i]]
  # No function specified. Map is assumed
  [map, []]

map = (item, position, list)->
  list.push item
  list
