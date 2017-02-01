###
Write Nesting Factory job
###
module.exports = (job, fldr)->
  task = file fldr, 'nest.task'
    .create()
  task.WriteLine """
    TASKNAME:\tSirius
    TIMELIMIT:\t60
    TASKTYPE:\tSHEET
    ITEM2DOMAINDIST:\t5
    ITEM2ITEMDIST:\t5
  """
  for z, i in job
    if z.list
      task.WriteLine """
        DOMAINFILE:\t#{i}.item
        SHEETQUANT:\t#{z.count}
      """
    else
      task.WriteLine """
        ITEMFILE:\t#{i}.item
        ITEMQUANT:\t#{z.count}
        ROTATE:\t1
        ROTSTEP:\tFREE
        REFLECT:\t1
      """
    geo = file fldr, "#{i}.item"
      .create()
    geo.WriteLine "ITEMNAME:\t#{i}"
    for part in z.geo
      for path in part.paths
        if isClosed path
          path = path.slice()
          path.pop()
        geo.WriteLine "VERTQUANT:\t#{path.length}"
        for node in path
          geo.WriteLine "VERTEX:\t#{node.join "\t"}"
  return

isClosed = (path)->
  if path.length < 2
    return
  a = path[0]
  z = path[path.length - 1]
  return a[0] == z[0] and a[1] == z[1]
