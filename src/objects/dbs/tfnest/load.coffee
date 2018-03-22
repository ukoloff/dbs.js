#
# Load TFNesting's XML
#
xml = require './xml'
tfnest = require './tfnest'

module.exports = (filename)->
  tfnest xml filename
