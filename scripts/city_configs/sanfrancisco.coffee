class SanFranciscoConfig

  constructor: (@google) ->

  mapOptions: ->
    center: new @google.maps.LatLng(47.6097, -122.3331)
    minZoom: 10
    zoom: 11

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

window.SanFranciscoConfig = SanFranciscoConfig
