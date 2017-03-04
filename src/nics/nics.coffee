###
Enumerate NICs
###
params = require './params'

unless /^[-.\w]+$/.test host = params.n or '.'
  echo "Invalid host:", host
  exit()

unless /\D/.test host
  host = "MR19-M117-W#{host}"

echo "Connecting to:", host
wmi = GetObject "winmgmts://#{host}/root/CIMv2"

if 2 == params.length
  echo "Access to NIC", params[0]
  nic = wmi.Get "Win32_NetworkAdapter.DeviceID=#{params[0]}"
  switch params[1]
    when '+'
      echo "Enabling..."
      nic.Enable()
    when '-'
      echo "Disabling..."
      nic.Disable()
    else
      if params[1]
        echo "Renaming to:", params[1]
        nic.NetConnectionID = params[1]
        nic.Put_()
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
