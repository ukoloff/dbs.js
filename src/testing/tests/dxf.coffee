###
Test DXF parser
###

describe "DXF parser", ->
  it "works", ->
    data = file "dxf/dxf.json"
      .load()
    for k, v of json2 data
      src = file "dxf/#{k}.dxf"

      dbs.idxf.config.spline = false
      if v.splines
        expect errors ->
          dbs.idxf src.open 1
        .to.equal 1
        dbs.idxf.config.spline = true

      res =
        partid: k
        paths: dbs.idxf src.open 1

      expect dbs.part.area res
      .to.be.closeTo v.area
      expect dbs.part.perimeter res
      .to.be.closeTo v.perimeter
      expect res.paths.length
      .to.equal v.paths.length

      for path, i in res.paths
        right = v.paths[i]
        expect dbs.path.area path
        .to.be.closeTo right.area
        expect dbs.path.perimeter path
        .to.be.closeTo right.perimeter
        expect path.length
        .to.equal right.count

errors = (cb)->
  errs = 0
  try
    cb()
  catch e
    errs++
  errs
