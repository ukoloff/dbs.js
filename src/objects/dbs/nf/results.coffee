###
Return results of nesting (array of DBS)
###
module.exports = (parsed, src)->
  for z in parsed
    if z.paths
      # nres-file: Geometry is ready
      z
    else if z.parts
      # trace-file: transform sources
      from = dbs.kol.parts src unless from
      bundle = dbs.o2 from.lists[z.list]
      for part in z.parts
        part = dbs.o2 from.parts[part.part], part.o2
      [].push.apply bundle, part
      bundle
