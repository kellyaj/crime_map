class InfoView extends Backbone.View

  initialize: (options) ->
    @incident = options.incident
    @google = options.google
    @map = options.map

  template: JST['js/templates/info_view.ejs']

  className: "info-view"

  render: ->
    @$el.html(@template(@displayData()))
    @renderStreetView()
    @

  displayData: ->
    'primary_type'         : @incident.get('primary_type')
    'description'          : @incident.get('description')
    'location_description' : @incident.get('location_description')
    'arrest_status'        : @formatArrestData()
    'incident_date'        : @incident.formattedDate()

  formatArrestData: ->
    if @incident.get('arrest')
      @arrestMadeHTML()
    else
      @noArrestMadeHTML()

  arrestMadeHTML: ->
    '<div class="arrest-made">ARREST MADE<span class="icon-cuffs"></span></div>'

  noArrestMadeHTML: ->
    '<div class="no-arrest">NO ARREST<span class="icon-warning"></span></div>'

  renderStreetView: ->
    panorama = new @google.maps.StreetViewPanorama(@$el.find('[data-id="pano"]')[0], {position: @incident.mapCoordinate, disableDefaultUI: true, clickToGo: true})
    @map.setStreetView(panorama)


window.InfoView = InfoView
