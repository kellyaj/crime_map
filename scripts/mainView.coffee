class MainView extends Backbone.View

  initialize: (options) ->
    @google = options.google
    @incidents = options.incidents

  template: JST['scripts/templates/main_view.ejs']

  events:
    'change [data-id="incident-count"]' : 'changeIncidentCount'
    'change [data-id="incident-type"]'  : 'changeIncidentType'
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
    @incidents.fetch({
      success: (data) =>
        @mapUtility.setUpIncidents(data)
    })

  changeIncidentCount: ->
    @$el.find('[data-id="flash"]').html("LOADING...")
    newLimit = @$el.find('[data-id="incident-count"] option:selected').data('count')
    @incidents.setLimit(newLimit)
    @incidents.fetch({
      reset: true,
      success: =>
        @$el.find('[data-id="flash"]').fadeOut("slow", =>
          @$el.find('[data-id="flash"]').empty()
          @$el.find('[data-id="flash"]').css('display', 'inline-block')
        )
        @mapUtility.renderFiltered(@incidents)
  })

  changeIncidentType: (event) ->
    @mapUtility.renderFiltered(@incidents)

  showAboutView: ->
    aboutView = new AboutView()
    @$el.find('[data-id="about-button"]').hide()
    @$el.find('[data-id="about-container"]').show()
    @$el.find('[data-id="about-container"]').html(aboutView.render().$el)

window.MainView = MainView
