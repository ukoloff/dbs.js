#
# Build DBS from TFNesting (nested .tfnesting -> [*.dbs])
#
module.exports = (data)->
  parts = {}
  lists = {}

  for part in data.lists
    lists[part.nest.id] = part
  for part in data.parts
    parts[part.nest.id] = part

  for sheet in data.results
    nesting = [dbs.part.o2 lists[sheet.list]]
    for part in sheet.parts
      o2r = dbs.o2.ccw part.angle
      if part.mirror
        o2r = dbs.o2.merge dbs.o2.antix(), o2r
      o2t = dbs.o2.translation part.delta
      nesting.push dbs.part.o2 parts[part.part], dbs.o2.merge o2t, o2r
    nesting
