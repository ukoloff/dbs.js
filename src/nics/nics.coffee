###
Enumerate NICs
###
params = require './params'

unless /^[-.\w]+$/.test host = params.n or '.'
  echo "Invalid host:", host
  exit()

unless /\D/.test host
  host = "MR19-M117-W-#{host}"

echo "Connecting to:", host
wmi = GetObject "winmgmts://./root/CIMv2"
