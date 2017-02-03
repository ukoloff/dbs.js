###
Check that source tree is not changed on rebuild
###
crypto = require 'crypto'

module.exports = ->
  apply: (compiler)->
    compiler.plugin "invalid", ->
      # The Compiler is in watch mode and a file change is detected. The compilation will begin shortly
      tree = require.resolve './sources'

      hash = do calc = ->
        z = crypto.createHash 'sha256'
        z.update JSON.stringify require tree
        z.digest 'hex'

      # Dirty hack to force rebuild source tree
      delete require.cache[tree]

      return if hash == do calc

      throw Error "Source tree changed!"
