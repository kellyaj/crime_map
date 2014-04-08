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
    @collection = new Incidents(@fakeCrimes)
    @mapUtility = new MapUtility(@fakeMap, @fakeGoogle)

  it 'generates a marker for each incident', ->
    markerSpy = spyOn @collection.models[0], 'generateMarker'

    @mapUtility.setUpIncidents(@collection, new ChicagoConfig())

    expect(markerSpy).toHaveBeenCalled()

