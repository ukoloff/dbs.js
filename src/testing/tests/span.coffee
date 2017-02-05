describe 'dbs::Span', ->
  it 'knows its radius', ->
    expect dbs.span.radius
      a: [0, 0]
      b: 1
      z: [1, 0]
    .to.be.closeTo 0.5

    expect dbs.span.radius
      a: [0, 1]
      b: -1
      z: [1, 0]
    .to.be.closeTo 1 / Math.sqrt 2

    expect dbs.span.radius
      a: [-1, 1]
      b: 1 / (1 + Math.sqrt 2)
      z: [0, 0]
    .to.be.closeTo 1
