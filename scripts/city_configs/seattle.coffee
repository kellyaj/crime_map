class SeattleConfig

  constructor: (@google) ->
    console.log @google

  mapOptions: ->
    center: new @google.maps.LatLng(47.6097, -122.3331)
    minZoom: 10
    zoom: 11

window.SeattleConfig = SeattleConfig
