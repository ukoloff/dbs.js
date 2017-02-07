describe 'DBS', ->
  it 'can be read from file', ->
    d = dbs.load 'ring.dbs'

    expect d
    .to.have.length 1

    paths = d[0].paths

    expect paths
    .to.have.length 2

    for path, i in paths
      expect path
      .to.have.length 3

      expect dbs.path.closed path
      .to.be.ok()

      dbs.path.spans path, (span)->
        expect dbs.point.abs dbs.span.center span
        .to.be.closeTo 0

        expect dbs.span.radius span
        .to.be.closeTo 2 - i
