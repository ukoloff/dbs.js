###
Write Nesting Factory job
###
module.exports = (job, fldr)->
  task = file fldr, 'nest.task'
    .create()
  # TIMELIMIT:
  # CAT_FAST_SPEED_MODE: 6,
  # CAT_RECOMMENDED_SPEED_MODE: 60
  # CAT_COMPLETE_SPEED_MODE: 600
  task.WriteLine """
    TASKNAME:\tSirius
    TIMELIMIT:\t6
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
    geo.WriteLine "ITEMNAME:\tgeo#{i}"
    geo.Write dbs.algomate z.geo
  return
