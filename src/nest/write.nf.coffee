###
Write Nesting Factory job
###
module.exports = (job, fldr)->
  task = file fldr, 'nest.task'
    .create()
  task.WriteLine """
    TASKNAME:\tCurrentNesting
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
  return
