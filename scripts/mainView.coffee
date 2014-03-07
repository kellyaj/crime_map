class MainView extends Backbone.View

  initialize: (options) ->
    @google = options.google
    @incidents = options.incidents

  template: JST['scripts/templates/main_view.ejs']

  events:
    'change [data-id="incident-count"]' : 'changeIncidentCount'
    'change [data-id="incident-type"]'  : 'changeIncidentType'
    'change [data-id="time-of-day"]'    : 'changeTimeOfDay'
    'click [data-id="about-button"]'    : 'showAboutView'

  render: ->
    @$el.html(@template())
    @renderMap()
    @renderLegendView()
    @createIncidents()
    @

  renderLegendView: ->
    @$el.find('[data-id="legend-container"]').html(new LegendView().render().$el)

  defaultMapOptions: ->
    center: new @google.maps.LatLng(41.833, -87.732)
    minZoom: 10
    zoom: 11

  renderMap: ->
    @map = new @google.maps.Map(@$el.find('[data-id="map-canvas"]')[0], @defaultMapOptions())
    @mapUtility = new MapUtility(@map, @google)

  createIncidents: ->
    @incidents.fetch
      reset: true
      success: (data) =>
        @mapUtility.setUpIncidents(data)

  changeIncidentCount: ->
    @displayLoading()
    newLimit = @$el.find('[data-id="incident-count"] option:selected').data('count')
    @incidents.setLimit(newLimit)
    @incidents.fetch
      reset: true
      success: =>
        @removeLoading()
        @mapUtility.renderFiltered(@incidents)

  flashEl: ->
    @$el.find('[data-id="flash"]')

  displayLoading: =>
    @flashEl().html("LOADING...")

  removeLoading: ->
    @flashEl().fadeOut "slow", =>
      @flashEl().empty()
      @flashEl().css('display', 'inline-block')

  changeIncidentType: (event) ->
    @mapUtility.renderFiltered(@incidents)

  changeTimeOfDay: (event) ->
    timeSelection = @$el.find('[data-id="time-of-day"] option:selected').data('time-of-day')
    @mapUtility.renderFiltered(new Incidents(@incidents.filterByTimeOfDay(timeSelection)))


  showAboutView: ->
    @$el.find('[data-id="about-button"]').hide()
    @$el.find('[data-id="about-container"]').show()
    @$el.find('[data-id="about-container"]').html(new AboutView().render().$el)

window.MainView = MainView
