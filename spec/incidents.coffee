describe 'Incidents', ->

  beforeEach ->
    @fakeCrimes = [
      {
        "primary_type" : "ARSON",
        "date"         : "2014-02-01T03:00:00"
      },
      {
        "primary_type" : "ARSON",
        "date"         : "2014-02-01T03:00:00"
      },
      {
        "primary_type" : "HOMICIDE",
        "date"         : "2014-02-01T15:00:00"
      },
      {
        "primary_type" : "ASSAULT",
        "date"         : "2014-02-01T15:00:00"
      },
      {
        "primary_type" : "BATTERY",
        "date"         : "2014-02-01T15:00:00"
      },
      {
        "primary_type" : "THEFT",
        "date"         : "2014-02-01T03:00:00"
      },
      {
        "primary_type" : "STALKING",
        "date"         : "2014-02-01T03:00:00"
      },
    ]
    @collection = new Incidents(@fakeCrimes)

  it 'defaults to a limit of 25', ->
    expect(@collection.limit).toEqual(25)

  it 'can have the limit set', ->
    @collection.setLimit(50)
    expect(@collection.limit).toEqual(50)

  it 'defaults to an offset of 0', ->
    expect(@collection.offset).toEqual(0)

  it 'increments the offset by an amount', ->
    @collection.changeOffset(50)
    expect(@collection.offset).toEqual(50)

  it 'decrements the offset by an amount', ->
    @collection.changeOffset(-30)
    expect(@collection.offset).toEqual(-30)

  it 'generates a url with the limit, offset, and sheet', ->
    @collection.setLimit(10)
    @collection.changeOffset(10)
    @collection.sheet = "someSheet"
    expectedUrl = "https://data.cityofchicago.org/resource/someSheet.json?$limit=10&$offset=10"
    expect(@collection.generateUrl()).toEqual(expectedUrl)

  it 'returns all models when the incidentType is ALL', ->
    expect(@collection.filterByType("ALL").length).toEqual(@fakeCrimes.length)

  it 'returns models for each category', ->
    expect(@collection.filterByType("VIOLENT").length).toEqual(3)
    expect(@collection.filterByType("PROPERTY").length).toEqual(1)
    expect(@collection.filterByType("PERSONAL").length).toEqual(1)
    expect(@collection.filterByType("OTHER").length).toEqual(2)

  it 'filters by day or night', ->
    expect(@collection.dayIncidents().length).toEqual(3)
    expect(@collection.nightIncidents().length).toEqual(4)
