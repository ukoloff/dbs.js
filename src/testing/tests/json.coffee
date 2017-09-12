describe 'JSON', ->
  it 'is good for DBS', ->
    z = dbs.load 'ring.dbs'
    j = dbs.json z
    expect j
    .to.equal dbs.json json2 j
