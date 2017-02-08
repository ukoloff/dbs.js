###
Return results of nesting (array of DBS)
###
module.exports = (parsed, src)->
  for z in parsed
    if z.parts
      # trace-file: transform sources
      from = dbs.kol.parts src unless from
      bundle = dbs.o2 from.lists[z.list].geo
      for part in z.parts
        [].push.apply bundle, dbs.o2 from.parts[part.part].geo, part.o2
      bundle
    else
      # nres-file: Geometry is ready
      z
