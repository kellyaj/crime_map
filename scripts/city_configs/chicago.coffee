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

  sheet: ->
    "qnmj-8ku6"

  resourceUrl: ->
    "https://data.cityofchicago.org/resource/"

  urlOptions: ->
    ""

  categories: ->
    "OTHER": [
        "ARSON",
        "GAMBLING",
        "INTERFERENCE WITH PUBLIC OFFICE",
        "LIQUOR LAW VIOLATION",
        "NARCOTICS",
        "NON-CRIMINAL",
        "OFFENSE INVOLVING CHILDREN",
        "OTHER NARCOTIC VIOLATION",
        "OTHER OFFENSE",
        "PROSTITUTION",
        "PUBLIC PEACE VIOLATION",
        "WEAPONS VIOLATION"
    ],
    "PERSONAL": [
      "DECEPTIVE PRACTICE",
      "INTIMIDATION",
      "OBSCENITY",
      "STALKING"
    ],
    "PROPERTY": [
      "BURGLARY",
      "CRIMINAL DAMAGE",
      "CRIMINAL TRESPASS",
      "MOTOR VEHICLE THEFT",
      "ROBBERY",
      "THEFT"
    ],
    "VIOLENT": [
      "ASSAULT",
      "BATTERY",
      "CRIM SEXUAL ASSAULT",
      "HOMICIDE",
      "KIDNAPPING",
      "SEX OFFENSE"
    ]

  categoryDisplayList: ->
    list = []
    _.each @masterList(), (categoryName) ->
      displayObject =
        raw_name: categoryName
        display_name: categoryName.charAt(0).toUpperCase() + categoryName.slice(1).toLowerCase()
      list.push displayObject
    list

  masterList: ->
    [
      "ASSAULT",
      "ARSON",
      "BATTERY",
      "BURGLARY",
      "CRIMINAL DAMAGE",
      "CRIMINAL TRESPASS",
      "CRIM SEXUAL ASSAULT",
      "DECEPTIVE PRACTICE",
      "GAMBLING",
      "HOMICIDE",
      "INTERFERENCE WITH PUBLIC OFFICE",
      "INTIMIDATION",
      "KIDNAPPING",
      "LIQUOR LAW VIOLATION",
      "MOTOR VEHICLE THEFT",
      "NARCOTICS",
      "NON-CRIMINAL",
      "OBSCENITY",
      "OFFENSE INVOLVING CHILDREN",
      "OTHER NARCOTIC VIOLATION",
      "OTHER OFFENSE",
      "PROSTITUTION",
      "PUBLIC PEACE VIOLATION",
      "ROBBERY",
      "SEX OFFENSE",
      "STALKING",
      "THEFT",
      "WEAPONS VIOLATION"
    ]

window.ChicagoConfig = ChicagoConfig
