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
        [].push.apply bundle, o2 from.parts[part.part].geo, part.o2
      bundle
    else
      # nres-file: Geometry is ready
      z

# Apply transform to DBS file
o2 = (file, o2)->
  file = dbs.o2 file, o2
  if 0 > dbs.o2.det o2
    dbs.reverse file
  else
    file
