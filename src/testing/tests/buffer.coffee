describe 'dbs::Buffer', ->
  it 'is array', ->
    expect dbs.buffer.alloc 5
    .to.be.an 'array'

    expect dbs.buffer.alloc()
    .to.be.empty()

    expect dbs.buffer.alloc n = 8
    .to.have.length n

  it 'allows append', ->
    b = dbs.buffer.alloc n = 7
    expect b
    .to.have.length n
    dbs.buffer.append b, dbs.buffer.alloc m = 5
    expect b
    .to.have.length n + m

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

  it 'writes floats', ->
    b = dbs.buffer.alloc 4

    dbs.buffer.set.float b, 108.9

    expect b.slice()
    .to.be.eql [0xCD, 0xCC, 0xD9, 0x42]

   it 'writes unsigned ints', ->
    b = dbs.buffer.alloc 6

    dbs.buffer.set.uint b, 1
    dbs.buffer.set.uint0 b, -2

    expect b.join ':'
    .to.be.eql '1:0:254:255:0:0'

    expect b._
    .to.be.eql 6
