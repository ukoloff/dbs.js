###
Render form
###
wnd.onunload = ->
  echo 'Bye!' if DEBUG
  exit 0

t = require './body.html'
css = require "../css"

style = $('style')[0]

if style.styleSheet
  style.styleSheet.cssText = css
else
  style.innerHTML = ''
  style.appendChild dom.createTextNode css

dom.body.innerHTML = t require './load'
