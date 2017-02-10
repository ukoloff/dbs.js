###
Parse command line
###
String::trim ||= ->
  @.replace /^\s+|\s+$/g, ''

do ->
  @console ||=
    log: echo
    info: echo
  @process ||=
    exit: exit

module.exports = require 'node-getopt'
.create [
  ['o', 'output=PATH', 'Save result to file/folder']
  ['f', 'force', 'Overwrite existing file']
  ['p', 'pretty', 'Pretty output (JSON only)']
  ['j', 'json', 'Output as JSON (default)']
  ['y', 'yaml', 'Output as YAML']
  ['d', 'dxf', 'Output as DXF']
  ['s', 'svg', 'Output as SVG (embedded into HTML)']
  ['a', 'algomate', "Output as Algomate's .item-file"]
]
.bindHelp()
