###
Launch Nesting Factory
###
found = (path)->
  bin = file path, 'CATAgent.exe'
  if bin.y()
    return bin

# Find in Program Files
at = (x)->
  found sh.ExpandEnvironmentStrings "%ProgramFiles#{x}%/Nesting Factory"

module.exports = (id)->
  unless exe = found(argv0.up()) or at('') or at('(x86)')
    throw Error "Cannot find Algomate's Nesting Factory"
  echo "Starting Nesting Factory..."
  child = sh.exec """
    "#{exe}" "#{id}"
  """
  start = new Date
  until child.Status
    wsh.Sleep 100
    wsh.StdOut.Write "\r#{Math.floor (new Date - start)/1000}"
  wsh.echo "\nDone!"
