class MapUtility

  constructor: (@map, @google) ->
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

  setUpIncidents: (data, cityConfig) =>
    @currentConfig = cityConfig
    @clearMarkers()
    _.each data.models, (incident) =>
      incident.generateMarker(@google, @map)
      incidentView = new InfoView
        incident: incident
        map: @map
        google: @google
        cityConfig: @currentConfig
      @addMarker(incident.marker)
      @google.maps.event.addListener incident.marker, "click", ->
        $('[data-id="info-container"]').html(incidentView.render().$el)

  renderFiltered: (incidentCollection) ->
    incidentType = $('[data-id="incident-type"] option:selected').data('incident-type')
    filteredCollection = new Incidents(incidentCollection.filterByType(incidentType))
    @setUpIncidents(filteredCollection, @currentConfig)

window.MapUtility = MapUtility
