###
Folder object methods
###

# Exists ?
exports.y = ->
  fso.FolderExists @

# rmdir
exports.rm = (ensure)->
  unless ensure and not @y()
    fso.DeleteFolder @
  @

# copy
exports.cp = (to)->
  fso.CopyFolder @, to
  return

# move
exports.mv = (to)->
  fso.MoveFolder @, to
  return

# mkdir -p with optional cleaning
exports.mk = (clean)->
  @rm clean if clean
  q = []
  _ = @_
  try
    f = @abs()
    until f.y()
      q.push f
      f = f.up()
    while f = q.pop()
      fso.CreateFolder f
    @
  finally
    @_ = _

# ActiveX Folder object
exports.$ = ->
  fso.GetFolder @

children = (list, args, map)->
  [fn, accumulator] = each.$ args, 0
  each list, accumulator, (child, n, accumulator)->
    fn map(child), n, accumulator

exports.files = ->
  children @$().Files, arguments, require './file'

exports.folders = ->
  children @$().SubFolders, arguments, require './folder'
