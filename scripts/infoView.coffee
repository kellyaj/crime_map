class InfoView extends Backbone.View

  initialize: (options) ->
    @incident = options.incident
    @google = options.google
    @map = options.map

  template: JST['js/templates/info_view.ejs']

  className: "info-view"

  render: ->
    @$el.html(@template(@displayData(@incident)))
    @renderStreetView()
    @

  displayData: (model) ->
    {
      'primary_type' : model.get('primary_type')
      'description' : model.get('description')
      'location_description' : model.get('location_description')
      'arrest_status' : this.formatArrestData()
      'incident_date' : model.formattedDate()
    }

  formatArrestData: ->
    if @incident.get('arrest')
      '<div class="arrest-made">ARREST MADE<span class="icon-cuffs"></span></div>'
    else
      '<div class="no-arrest">NO ARREST<span class="icon-warning"></span></div>'

  renderStreetView: ->
    place = new @google.maps.LatLng(@incident.get('latitude'), @incident.get('longitude'))
    panorama = new @google.maps.StreetViewPanorama(@$el.find('[data-id="pano"]')[0], {position: place, disableDefaultUI: true, clickToGo: true})
    @map.setStreetView(panorama)


window.InfoView = InfoView
