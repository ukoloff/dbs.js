###
Standalone SVG output
###
module.exports = (file)->
  dbs.svg file, defs

defs = """

<link xmlns="http://www.w3.org/1999/xhtml" rel="stylesheet" href="../style.css" type="text/css"/>
"""
