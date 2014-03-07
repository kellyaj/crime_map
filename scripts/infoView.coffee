class InfoView extends Backbone.View

  initialize: (options) ->
    @google = options.google
    @incident = options.incident
    @map = options.map
    @locations = new Locations()
    @setLocationCategory()

  template: JST['scripts/templates/info_view.ejs']

  className: "info-view"

  render: ->
    @$el.html(@template(@displayData()))
    @renderStreetView()
    @

  displayData: ->
    'primary_type'         : @incident.get('primary_type')
    'description'          : @incident.get('description')
    'location_description' : @incident.get('location_description')
    'location_icon'        : @getLocationIcon()
    'arrest_status'        : @formatArrestData()
    'incident_date'        : @incident.formattedDate()

  formatArrestData: ->
    if @incident.get('arrest')
      @arrestMadeHTML()
    else
      @noArrestMadeHTML()

  setLocationCategory: ->
    @locationCategory = @locations.getCategoryFor(@incident.get('location_description'))
  arrestMadeHTML: ->
    '<div class="arrest-made"><span class="icon-cuffs"></span>ARREST MADE</div>'

  noArrestMadeHTML: ->
    '<div class="no-arrest"><span class="icon-warning"></span>NO ARREST</div>'

  getLocationIcon: ->
    @locationCategory.iconSpan

  renderStreetView: ->
    panorama = new @google.maps.StreetViewPanorama(@$el.find('[data-id="pano"]')[0], {position: @incident.mapCoordinate, disableDefaultUI: true, clickToGo: true})
    @map.setStreetView(panorama)


window.InfoView = InfoView
