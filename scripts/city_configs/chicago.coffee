class ChicagoConfig

  constructor: (@google) ->

  mapOptions: ->
    center: new @google.maps.LatLng(41.833, -87.732)
    minZoom: 10
    zoom: 11

window.ChicagoConfig = ChicagoConfig
