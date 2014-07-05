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
    @collection.setCityConfig(new ChicagoConfig())
    _.each @collection.models, (model) ->
      model.setTimeOfDay()

  it 'defaults to a limit of 200', ->
    expect(@collection.limit).toEqual(200)

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

  it 'does not append a where query if categoryArray is empty', ->
    expectedUrl = "https://data.cityofchicago.org/resource/ijzp-q8t2.json?$limit=200&$offset=0"
    expect(@collection.categoryArray.length).toEqual(0)
    expect(@collection.generateUrl()).toEqual(expectedUrl)

  it 'generates a url with a where query based on the categoryArray', ->
    @collection.categoryArray = ["ROBBERY", "THEFT"]
    expectedUrl = "https://data.cityofchicago.org/resource/ijzp-q8t2.json?$limit=200&$offset=0&$where=primary_type='ROBBERY' OR primary_type='THEFT'"
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
