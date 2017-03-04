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

if 2 == params.length
  echo "Access to NIC", params[0]
else
  echo "Enumerating NICs..."
  nics = wmi.ExecQuery "SELECT * FROM Win32_NetworkAdapter#{
    if params.a
      ''
    else ' Where PhysicalAdapter = True'
    }"
  each nics, (nic)->
    echo "#{nic.DeviceID}\t#{
      if nic.NetEnabled
        '+'
      else
        '-'
      } #{nic.NetConnectionID or '?'}\t(#{nic.ProductName or '?'})"
