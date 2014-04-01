class ChicagoConfig

  constructor: (@google) ->

  mapOptions: ->
    center: new @google.maps.LatLng(41.833, -87.732)
    minZoom: 10
    zoom: 11

  normalizedData: ->
    'primary_type': 'primary_type'
    'primary_description': 'primary_description'
    'description': 'description'
    'location_description': 'location_description'
    'date': 'date'
    'latitude': 'latitude'
    'longitude': 'longitude'
    'arrest': 'arrest'

window.ChicagoConfig = ChicagoConfig
