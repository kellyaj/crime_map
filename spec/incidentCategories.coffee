describe 'IncidentCategories', ->

  beforeEach ->
    @incidentCategories = new IncidentCategories()
    @incidentCategories.config = new ChicagoConfig()

  it 'has each incident type categorized via the config', ->
    expect(@incidentCategories.config.categories()["OTHER"].length).toBe(12)
    expect(@incidentCategories.config.categories()["PERSONAL"].length).toBe(4)
    expect(@incidentCategories.config.categories()["VIOLENT"].length).toBe(6)
    expect(@incidentCategories.config.categories()["PROPERTY"].length).toBe(6)

  it "can determine if an incident is violent", ->
    expect(@incidentCategories.isViolent("THEFT")).toBeFalsy()
    expect(@incidentCategories.isViolent("ASSAULT")).toBeTruthy()

  it "can determine if an incident is property", ->
    expect(@incidentCategories.isProperty("ASSAULT")).toBeFalsy()
    expect(@incidentCategories.isProperty("THEFT")).toBeTruthy()

  it "can determine if an incident is personal", ->
    expect(@incidentCategories.isPersonal("ASSAULT")).toBeFalsy()
    expect(@incidentCategories.isPersonal("STALKING")).toBeTruthy()

  it "can determine if an incident is other", ->
    expect(@incidentCategories.isOther("ASSAULT")).toBeFalsy()
    expect(@incidentCategories.isOther("GAMBLING")).toBeTruthy()

  it "has a marker icon for each category", ->
    expect(@incidentCategories.markerIcons()["VIOLENT"]).toBeDefined()
    expect(@incidentCategories.markerIcons()["PROPERTY"]).toBeDefined()
    expect(@incidentCategories.markerIcons()["PERSONAL"]).toBeDefined()
    expect(@incidentCategories.markerIcons()["OTHER"]).toBeDefined()
