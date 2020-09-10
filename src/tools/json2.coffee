###
JSON parser
Experimental!
No longer https://github.com/douglascrockford/JSON-js
###
module.exports = (text)->
  text += ''
  if /[^{\[:\s,\]}]/.test text.replace ///
    -? \d+ (?: [.]\d* )? (?: [eE][-+]?\d+ )?
    |
    " (?: \\. | [^"\\] )* "
    |
    \b (?: null | true | false ) \b
    ///g, ']'
    throw Error "Invalid JSON"
  do new Function "return (#{text})"
