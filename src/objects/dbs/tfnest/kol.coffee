#
# Build NCL job (not-nested .tfnesting -> .kol + [*.dbs])
#
module.exports = (data)->
  result = []

  for part in data.lists when not part.nest.disable
    result.push
      list: true
      count: part.nest.count
      geo: [part]
  for part in data.parts when not part.nest.disable
    result.push
      list: false
      count: part.nest.count
      geo: [part]

  result
