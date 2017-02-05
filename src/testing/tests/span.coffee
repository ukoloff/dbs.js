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

  it 'knows its center', ->
    expect dbs.span.center
      a: [1, 0]
      b: 1
      z: [0, 1]
    .to.be.eql [0.5, 0.5]

    c = dbs.span.center
      a: [0, 1]
      b: -1 / (1 + Math.sqrt 2)
      z: [1, 0]
    expect dbs.point.abs dbs.point.sub c, [0, 0]
    .to.be.closeTo 0

  it 'knows its points', ->
    span =
      a: [1, 0]
      b: -1
      z: [0, 1]

    expect dbs.span.point span, -1
    .to.be.eql span.a

    expect dbs.span.point span, +1
    .to.be.eql span.z

    expect zenith = dbs.span.point span, 0
    .to.be.eql [0, 0]

    expect dbs.span.zenith span
    .to.be.eql zenith

    expect dbs.span.nadir span
    .to.be.eql [1, 1]
