class MapUtility
  initialize: () ->
    @markers = []

  setAllMarkers: (map) ->
    _.each @markers, (marker) ->
      marker.setMap(map)

  clearMarkers: ->
    _.each @markers, (marker) =>
      @setAllMarkers(null)
    @markers = []

  addMarker: (marker) ->
    @markers.push(marker)

window.MapUtility = MapUtility
