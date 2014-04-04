class SeattleConfig

  constructor: (@google) ->

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

  sheet: ->
    "7ais-f98f"

  resourceUrl: ->
    "https://data.seattle.gov/resource/"

  urlOptions: ->
    "&$order=occurred_date_or_date_range_start%20desc"

window.SeattleConfig = SeattleConfig
