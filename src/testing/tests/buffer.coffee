describe 'dbs::Buffer', ->
  it 'is array', ->
    expect dbs.buffer.alloc 5
    .to.be.an 'array'

    expect dbs.buffer.alloc()
    .to.be.empty()

    expect dbs.buffer.alloc n = 8
    .to.have.length n

  it 'reads unsigned ints', ->
    b = dbs.buffer.alloc 6
    for z, i in b by -1
      b[i] = i + 1

    expect dbs.buffer.get.uint b
    .to.be 0x0201

    expect dbs.buffer.get.uint b
    .to.be 0x0403

    expect dbs.buffer.get.uint b
    .to.be 0x0605

    b._ = 0

    expect dbs.buffer.get.uint0 b
    .to.be 0x0201

    expect dbs.buffer.get.uint0 b
    .to.be 0x0605

  it 'reads floats', ->
    b = dbs.buffer.alloc 4

    for z, i in [0x7b, 0x14, 0x29, 0xc2] by -1
        b[i] = z

    expect dbs.buffer.get.float b
    .to.be.closeTo -42.27
