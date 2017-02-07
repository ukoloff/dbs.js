describe 'dbs::Span.uniform', ->
  it 'is rather uniform', ->
    N = 10
    span =
      a: [0, 1]
      b: 42
      z: [1, 0]

    while span.b >= 0
      j = 0
      while j <= N
        p1 = dbs.span.uniform span, j / N
        p2 = dbs.span.uniform span, (j - 0.1) / N
        dist = dbs.point.abs dbs.point.sub p1, p2
        if !j or min > dist
          min = dist
        if !j or max < dist
          max = dist
        j++
      span.b--

      expect max / min - 1
      .to.be.below 0.205
    return
