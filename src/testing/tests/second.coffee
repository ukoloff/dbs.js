describe 'Second suit', ->
  it 'Second test', ->
    expect(6*7).to.be.a 'number'

  it 'Third test', ->
    expect('').to.be.a 'string$'

  it 'Equality', ->
    expect(Math.sqrt 2).to.be.closeTo 2 / Math.sqrt 2

  it 'Inequality', ->
    expect(Math.sqrt 2).not.to.be.closeTo 1.4
