describe 'Incident', ->

  beforeEach ->
    @fakeIncident = {
      "case_number" : "HX135149",
      "beat" : "0822",
      "location" : {
        "needs_recoding" : false,
        "longitude" : "-87.70856015252158",
        "latitude" : "41.79185339253908"
      },
      "x_coordinate" : "1154624",
      "block" : "055XX S HOMAN AVE",
      "primary_type" : "ARSON",
      "location_description" : "RESIDENCE",
      "date" : "2014-02-01T05:00:00",
      "iucr" : "0486",
      "domestic" : true,
      "id" : "9481932",
      "ward" : "14",
      "arrest" : false,
      "description" : "IT GOT HOT",
      "y_coordinate" : "1867361",
      "updated_on" : "2014-02-04T00:39:03",
      "fbi_code" : "08B",
      "longitude" : "-87.70856015252158",
      "year" : "2014",
      "community_area" : "63",
      "latitude" : "41.79185339253908",
      "district" : "008"
    }

    @fakeGoogle = {maps: {}}
    @fakeGoogle.maps.LatLng = ->
    @fakeGoogle.maps.Marker = ->
    @incident = new Incident(@fakeIncident)
    @_createIncident = (primaryType) ->
      newIncident = new Incident({"primary_type": primaryType})
      newIncident.setIncidentCategory()
      newIncident

  it 'generates a google maps marker based on its information', ->
    @incident.generateMarker(@fakeGoogle)

    expect(@incident.marker).toBeDefined()

  it 'formats the date into human readable format', ->
    expect(@incident.formattedDate()).toContain("02/01/2014 05:00")

  it 'considers day as time between 06:00 and 22:00', ->
    expect(@incident.isDayTime("05:59")).toEqual(false)
    expect(@incident.isDayTime("06:00")).toEqual(true)
    expect(@incident.isDayTime("21:59")).toEqual(true)
    expect(@incident.isDayTime("22:00")).toEqual(false)
    expect(@incident.isDayTime("03:45")).toEqual(false)

  it 'adds the moon icon span when the time is considered night', ->
    expect(@incident.formattedDate()).toContain('class="icon-moon"')

  it 'adds the sun icon span when the time is considered day', ->
    @incident.set('date', "2014-02-01T09:00:00")
    expect(@incident.formattedDate()).toContain('class="icon-sun"')

  it 'sets the incidentCategory based on the primaryType', ->
    violentIncident = @_createIncident("ASSAULT")
    personalIncident = @_createIncident("STALKING")
    propertyIncident = @_createIncident("THEFT")
    otherIncident = @_createIncident("ARSON")
    expect(violentIncident.incidentCategory).toEqual("VIOLENT")
    expect(personalIncident.incidentCategory).toEqual("PERSONAL")
    expect(propertyIncident.incidentCategory).toEqual("PROPERTY")
    expect(otherIncident.incidentCategory).toEqual("OTHER")
