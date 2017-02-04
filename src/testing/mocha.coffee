###
Emulate mocha https://mochajs.org/
###

newTest = (title, fn)->
  title: title
  fn: fn
  up: []
  suits: [] unless fn
  tests: [] unless fn

insert = (parent, child)->
  for z in child.up = [parent].concat parent.up
    (if child.fn then z.suits else z.tests).push child
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

for t in root.tests
  echo "-", t.title
