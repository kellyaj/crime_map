class SeattleConfig

  constructor: (@google) ->
    console.log @google

  mapOptions: ->
    center: new @google.maps.LatLng(47.6097, -122.3331)
    minZoom: 10
    zoom: 11

  normalizedData: ->
    'primary_type': 'summarized_offense_description'
    'primary_description': ''
    'description': 'offense_type'
    'location_description': 'hundred_block_location'
    'date': 'occurred_date_or_date_range_start'
    'latitude': 'latitude'
    'longitude': 'longitude'
    'arrest': ''


window.SeattleConfig = SeattleConfig
