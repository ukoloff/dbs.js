do ->
  @expect = require 'expect.js'

for k, v of require './tests'
  do v
