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

  it 'can find bulge & position for any point', ->
    N = 10
    span =
      a: [1, 0]
      b: 2
      z: [0, 2]

    while span.b >= 0
      j = N
      while j >=0
        pos = j / N

        p = dbs.span.point span, pos
        expect dbs.span.position span, p
        .to.be.closeTo pos

        b1 = dbs.span.bulge.left span, pos
        b2 = dbs.span.bulge.right span, pos

        expect (b1 + b2) / (1 - b1 * b2)
        .to.be.closeTo span.b

        expect b1
        .not.be.below 0
        expect b2
        .to.be.below 1
        .and.not.be.below 0

        if j-- == N
          continue

        expect dbs.span.bulge span, p
        .to.be.closeTo span.b

      span.b--
    return

  it 'knows its perimeter', ->
    span =
      a: [0, 0]
      b: 0
      z: [0, 1]
    eq = (p)->
      expect dbs.span.perimeter span
      .to.be.closeTo p
    eq 1
    span.a[1] = 2
    eq 1
    span.a[0] = 1
    eq Math.sqrt 2
    span.b = Math.sqrt(2) - 1
    eq Math.PI / 2
    span.b = -span.b
    eq Math.PI / 2
    span.b = 1
    eq Math.PI / Math.sqrt 2
    span.b = -1
    eq Math.PI / Math.sqrt 2

  it 'knows its area', ->
    span =
      a: [0, 0]
      b: 0
      z: [0, 1]
    eq = (p)->
      expect dbs.span.area span
      .to.be.closeTo p

    eq 0
    span.z[0] = 1
    eq 0
    span.a[1] = 1
    eq 0.5

    span =
      a: [10, 0]
      b: 1
      z: [11, 0]

    eq -Math.PI / 8
    span.b = 1 - Math.sqrt 2
    eq Math.PI / 8 - 1 / 4
