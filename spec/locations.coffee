describe 'Locations', ->

  beforeEach ->
    @locations = new Locations()

  it 'gets the location category for a categorized location', ->
    expect(@locations.getCategoryFor("APARTMENT")).toBe("HOME")

  it 'returns OTHER for an uncategorized location', ->
    expect(@locations.getCategoryFor("AIRPORT VENDING ESTABLISHMENT")).toBe("OTHER")

  it 'returns OTHER for an unidentified location', ->
    expect(@locations.getCategoryFor("SOMETHING ELSE")).toBe("OTHER")
