describe 'DBS', ->
  it 'can be read from file', ->
    d = dbs.load 'ring.dbs'

    expect d
    .to.have.length 1

    paths = d[0].paths

    expect paths
    .to.have.length 2

    for path in paths
      expect path
      .to.have.length 3

      expect dbs.path.closed path
      .to.be.ok()
