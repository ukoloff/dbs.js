###
Submit handler
###
$('form')[0].onsubmit = ->
  for z in @elements when z.name
    switch z.type.charAt 0
      when 'r'
        # Radio
        if z.checked
          dbs.nf.config[z.name] = z.value
      when 'c'
        # Checkbox
        dbs.nf.config[z.name] = if z.checked then '1' else ''
      else
        # Number / Text
        unless /^(?!00)\d+$/.test z.value
          z.focus()
          return false
        dbs.nf.config[z.name] = z.value
  try
    dbs.nf.config.save require './storage'
    wnd.close()
  catch e
    alert "ERROR: #{e.message}"
  false
