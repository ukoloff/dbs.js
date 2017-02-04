###
Some patches for expect.js
###
expect = require 'expect.js'

do ->
  @expect = expect

total = failed = 0

exports.counts = ->
  ok: total - failed
  failed: failed
  total: total

proto = expect.Assertion::

assert = proto.assert

proto.assert = ->
  total++
  try
    return assert.apply @, arguments
  catch e
    failed++
    throw e

proto.closeTo = (value, eps = 1e-3)->
  @assert Math.abs(@obj - value) < eps,
    => "expected #{@obj} to be approximately #{value}"
    => "expected #{@obj} to be not approximately #{value}"
