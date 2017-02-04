###
Emulate mocha https://mochajs.org/
###
expect = require './expect'

newTest = (title, fn)->
  title: title
  fn: fn
  up: []
  suits: [] unless fn
  tests: [] unless fn

insert = (parent, child)->
  for z in child.up = [parent].concat parent.up
    (if child.fn then z.tests else z.suits).push child
  return

exec = (suit, fn)->
  return if suit.fn
  setCurrent suit
  do fn
  setCurrent suit.up[0]

handler = (suit, describe)->
  if suit?.tests
    (title, fn)->
      insert suit, child = newTest title, unless describe then fn
      child.file = suit.file
      exec child, fn
  else
    ->
      throw Error "Method #{
      if describe
        "describe"
      else
        "it"
      } is not accessible here!"

setCurrent = (suit)-> do ->
  @describe = handler suit, true
  @it = handler suit

root = newTest ''

for k, v of require './tests'
  root.file = k
  exec root, v
root.file = root.fn

shuffle = (array)->
  array = array.slice()
  for v, i in array by -1
    array[i] = array[n = Math.floor array.length * Math.random()]
    array[n] = v
  array

for t in shuffle root.tests by -1
  t.start = start = new Date
  for s in t.up by -1
    s.start ||= start
    s.ok ||= 0
    s.failed ||= 0
    s.total ||= 0
    s.total++
  try
    do t.fn
  catch e
    t.error = e
  t.stop = stop = new Date
  for s in t.up by -1
    s.stop = stop
    if t.error
      s.failed++
    else
      s.ok++

  wsh.StdOut.Write if t.error then '!' else '.'

echo '\n'

if root.failed
  echo "Failed test(s):"
  do report = (suit = root)->
    prefix = ''
    for z in suit.up
      prefix += '  '
    for z in suit.suits when z.failed
      echo "#{prefix}- #{z.title}"
      report z
    prefix += '  '
    for z in suit.tests when z.error and z.up[0] == suit
      echo "#{prefix}# #{z.title}"
      echo "#{prefix}  : #{z.error.message}"
    return
  echo ""

counts = (data)->
  "+ #{data.ok} - #{data.failed} = #{data.total}"

echo "Tests:", counts root
echo "Assertions:", counts expect.counts()
echo "Time spent:", (root.stop - root.start) / 1000, 's'
