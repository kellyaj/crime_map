describe 'Locations', ->

  beforeEach ->
    @locations = new Locations()
    @categories = @locations.category()

  it 'gets the location category for a categorized location', ->
    expect(@locations.getCategoryFor("APARTMENT")).toEqual(@categories["HOME"])

  it 'returns OTHER for an uncategorized location', ->
    expect(@locations.getCategoryFor("AIRPORT VENDING ESTABLISHMENT")).toEqual(@categories["OTHER"])

  it 'returns OTHER for an unidentified location', ->
    expect(@locations.getCategoryFor("SOMETHING ELSE")).toEqual(@categories["OTHER"])
