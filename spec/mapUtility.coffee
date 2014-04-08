describe 'MainView', ->

  beforeEach ->
    @fakeMap =
      setStreetView: ->
    @fakeGoogle =
      maps:
        StreetViewPanorama: ->
        LatLng: ->
        Map: ->
        event:
          addListener: ->
    @fakeCrimes = [ { "primary_type" : "ARSON", "date": "2014-02-01T03:00:00" }]
    @chicagoConfig = new ChicagoConfig()
    @collection = new Incidents(@fakeCrimes)
    @mapUtility = new MapUtility(@fakeMap, @fakeGoogle)
    @incident = @collection.models[0]
    @markerSpy = spyOn(@incident, 'generateMarker')

  it 'generates a marker for each incident', ->
    @mapUtility.setUpIncidents(@collection, @chicagoConfig)

    expect(@markerSpy).toHaveBeenCalled()

  it 'adds a click listener for markers', ->
    @incident.marker = {"some": "data"}
    googleSpy = spyOn @fakeGoogle.maps.event, 'addListener'

    @mapUtility.setUpIncidents(@collection, @chicagoConfig)

    expect(googleSpy.mostRecentCall.args[0]).toEqual(@incident.marker)

  it 'adds markers on setUp', ->
    @incident.marker = {"some": "data"}

    @mapUtility.setUpIncidents(@collection, @chicagoConfig)

    expect(@mapUtility.markers).toContain(@incident.marker)

  it 'clears the markers on setUp by setting their map to null', ->
    fakeMarker =
      setMap: ->
    setMapSpy = spyOn(fakeMarker, 'setMap')
    @mapUtility.markers = [fakeMarker]

    @mapUtility.setUpIncidents(@collection, @chicagoConfig)

    expect(setMapSpy).toHaveBeenCalledWith(null)
