class SanFranciscoConfig

  constructor: (@google) ->

  mapOptions: ->
    center: new @google.maps.LatLng(37.7833, -122.4167)
    minZoom: 10
    zoom: 10

  normalizedData: ->
    'primary_type': ''
    'primary_description': ''
    'description': ''
    'location_description': ''
    'date': ''
    'latitude': ''
    'longitude': ''
    'arrest': ''

  sheet: ->
    "snsg-xkfg"

  resourceUrl: ->
    "https://data.sfgov.org/resource/"

  categoryDisplayList: ->
    [{}]


window.SanFranciscoConfig = SanFranciscoConfig
