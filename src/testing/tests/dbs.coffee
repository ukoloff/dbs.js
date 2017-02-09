describe 'DBS', ->
  it 'knows its bounds', ->
    b = dbs.bounds z = dbs.load 'ring.dbs'
    expect b[0][0]
    .to.be.closeTo b[0][1]
    .and.to.be.closeTo -b[1][0]
    .and.to.be.closeTo -b[1][1]
    .and.to.be.closeTo -2

    b = dbs.bounds dbs.load 'rounded3x4.dbs'
    expect dbs.point.abs b[0]
    .to.be.closeTo 0
    expect dbs.point.abs dbs.point.sub b[1], [3, 4]
    .to.be.closeTo 0
