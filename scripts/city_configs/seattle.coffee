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

  categories: ->
    "OTHER": [
      "ANIMAL COMPLAINT",
      "COUNTERFEIT",
      "DUI",
      "ELUDING",
      "EMBEZZLE",
      "FALSE REPORT",
      "FIREWORK",
      "FORGERY",
      "FRAUD",
      "FRAUD AND FINANCIAL",
      "GAMBLE",
      "ILLEGAL DUMPING",
      "[INC - CASE DC USE ONLY]",
      "INJURY",
      "LIQUOR VIOLATION",
      "LOST PROPERTY",
      "MAIL THEFT",
      "NARCOTICS",
      "OBSTRUCT",
      "PROPERTY DAMAGE",
      "PROSTITUTION",
      "PUBLIC NUISANCE",
      "RECKLESS BURNING",
      "RECOVERED PROPERTY",
      "STAY OUT OF AREA DRUGS",
      "STAY OUT OF AREA PROSTITUTION",
      "THEFT OF SERVICES",
      "TRAFFIC",
      "TRESPASS",
      "VIOLATION OF COURT ORDER",
      "WARRANT ARREST",
    ],
    "PERSONAL": [
      "BIAS INCIDENT",
      "DISORDERLY CONDUCT",
      "DISPUTE",
      "DISTURBANCE",
      "EXTORTION",
      "THREATS",
    ],
    "PROPERTY": [
      "BIKE THEFT",
      "Bike Theft",
      "BURGLARY",
      "BURGLARY-SECURE-PARKING-RES",
      "CAR PROWL",
      "Car Prowl",
      "PURSE SNATCH",
      "Purse Snatch",
      "OTHER PROPERTY",
      "Other Property",
      "SHOPLIFTING",
      "Shoplifting",
      "STOLEN PROPERTY",
      "VEHICLE THEFT",
    ],
    "VIOLENT": [
      "ASSAULT",
      "HOMICIDE",
      "ROBBERY",
      "WEAPON"
    ]

window.SeattleConfig = SeattleConfig
