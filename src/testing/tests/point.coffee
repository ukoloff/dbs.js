describe 'dbs::Point', ->
  it 'supports =', ->
    expect dbs.point.eq [1, 2], a = [1, 2]
    .to.be.ok()

    expect dbs.point.eq a, [1, 3]
    .not.to.be.ok()

    expect dbs.point.eq  a, a2 = dbs.point.o2 a
    .to.be.ok()

    expect a
    .not.to.be a2

    expect a
    .to.be.eql a2

  it 'supports +/-', ->
    expect dbs.point.add [1, 2], [3, 4]
    .to.be.eql [4, 6]

    expect dbs.point.sub [9, 8], [7, 6]
    .to.be.eql [2, 2]

  it 'supports * and /', ->
    expect dbs.point.mul [1, 2], 3
    .to.be.eql [3, 6]

    expect dbs.point.mul [4, 3], [2, 1]
    .to.be.eql [5, 10]

    expect dbs.point.div [12, -15], 3
    .to.be.eql [4, -5]

    expect dbs.point.div [5, 10], [3, -4]
    .to.be.eql [-1, 2]
