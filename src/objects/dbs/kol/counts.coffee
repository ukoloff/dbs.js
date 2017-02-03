###
Show counts
###
module.exports = (job)->
  pn = pc = ln = lc = 0
  for z in job
    if z.list
      ln++
      lc += z.count
    else
      pn++
      pc += z.count
  echo "Found #{pc}/#{pn} part(s) on #{lc}/#{ln} list(s)"
