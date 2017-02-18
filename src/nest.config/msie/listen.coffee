###
Submit handler
###
save = require './save'

$('form')[0].onsubmit = ->
  result = {}
  for z in @elements when z.name
    switch z.type.charAt 0
      when 'r'
        # Radio
        if z.checked
          result[z.name] = z.value
      when 'c'
        # Checkbox
        result[z.name] = if z.checked then '1' else ''
      else
        # Number / Text
        unless /^(?!00)\d+$/.test z.value
          z.focus()
          return false
        result[z.name] = z.value
  try
    save result
    wnd.close()
  catch e
    alert "ERROR: #{e.message}"
  false
