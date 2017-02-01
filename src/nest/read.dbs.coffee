###
Read DBS file
###
exe = file argv0.up(), 'dbs2json.exe'

module.exports = (f)->
  unless f.y()
    throw Error "File not found:", f
  child = sh.exec """
      "#{exe}" "#{f}"
    """
  wsh.Sleep 10 until child.Status
  json2 child.StdOut.ReadAll()
