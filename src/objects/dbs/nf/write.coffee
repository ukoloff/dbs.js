###
Write Nesting Factory job
###
config = require './config'
module.exports = (job, fldr)->
  task = file fldr, 'nest.task'
    .create()
  task.WriteLine """
    TASKNAME:\tSirius
    TIMELIMIT:\t#{config.time}
    TASKTYPE:\tSHEET
    ITEM2DOMAINDIST:\t#{config.gap}
    ITEM2ITEMDIST:\t#{config.border}
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
        ROTATE:\t#{if config.rotate then 1 else 0}
        ROTSTEP:\t#{rotStep config.rotate}
        REFLECT:\t#{if config.mirror then 1 else 0}
      """
    geo = file fldr, "#{i}.item"
      .create()
    geo.WriteLine "ITEMNAME:\tgeo#{i}"
    geo.Write dbs.algomate z.geo
  return

rotStep = (step)->
  switch step
    when 0
      'NO'
    when 90
      'PI/2'
    when 180
      'PI'
    else
      'FREE'
