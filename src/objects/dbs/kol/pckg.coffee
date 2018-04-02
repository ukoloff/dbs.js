###
Save .kol + *.dbs into folder
###
prefixes = ['list', 'part']

module.exports = (job, fldr)->
  counts = [0, 0]
  ids = [0, 0]
  for z in job
    counts[Number !z.list]++

  kol = file fldr, fldr.abs().bn() + ".kol"
    .create()
  for z in job
    idx = Number !z.list
    filename = "#{prefixes[idx]}-#{formatN ++ids[idx], counts[idx]}"
    kol.WriteLine("#{file fldr, filename} #{z.count} #{idx}")
    dbs.save z.geo, file fldr, filename + '.dbs'

formatN = (n, max)->
  n = "#{n}"
  max = "#{max}".length
  while n.length < max
    n = "0#{n}"
  n
