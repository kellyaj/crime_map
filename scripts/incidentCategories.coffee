class IncidentCategories

  isViolent: (selectedType) ->
    _.contains @config.categories()["VIOLENT"], selectedType

  isProperty: (selectedType) ->
    _.contains @config.categories()["PROPERTY"], selectedType

  isPersonal: (selectedType) ->
    _.contains @config.categories()["PERSONAL"], selectedType

  isOther: (selectedType) ->
    _.contains @config.categories()["OTHER"], selectedType

  markerIcons: ->
    "VIOLENT"  : "http://maps.google.com/mapfiles/ms/icons/red-dot.png",
    "PROPERTY" : "http://maps.google.com/mapfiles/ms/icons/blue-dot.png",
    "PERSONAL" : "http://maps.google.com/mapfiles/ms/icons/yellow-dot.png",
    "OTHER"    : "http://maps.google.com/mapfiles/ms/icons/green-dot.png"


window.IncidentCategories = IncidentCategories
