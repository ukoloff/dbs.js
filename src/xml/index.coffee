#
# Try to parse XML
#
xml = require './xml'
tfnest = require './tfnest'
build = require './build'

data = xml 'tflex.xml'

nested = tfnest data
result = build nested

for r in result
  echo dbs.json r
