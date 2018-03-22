#
# Build DBS from TFNesting
#
module.exports = (data)->
  parts = {}
  lists = {}

  for part in data.lists when not part.nest.disabled
    lists[part.nest.id] = part
  for part in data.parts when not part.nest.disabled
    parts[part.nest.id] = part

  for sheet in data.results
    nesting = [dbs.part.o2 lists[sheet.list]]
    for part in sheet.parts
      o2t = dbs.o2.translation part.delta
      o2r = dbs.o2.ccw part.angle
      o2full = dbs.o2.merge o2t, o2r
      nesting.push dbs.part.o2 parts[part.part], o2full
    nesting
