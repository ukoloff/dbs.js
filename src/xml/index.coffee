#
# Try to parse XML
#
xml = require './xml'
tfnest = require './tfnest'

data = xml 'tflex.xml'

tfnest data
# echo yaml.safeDump data
