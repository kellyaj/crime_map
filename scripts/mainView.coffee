class MainView extends Backbone.View

  initialize: (options) ->
    @google = options.google
    @incidents = options.incidents
    @incidentCategories = new IncidentCategories()

  template: JST['scripts/templates/main_view.ejs']

  events:
    'change [data-id="incident-count"]'   : 'changeIncidentCount'
    'change [data-id="incident-type"]'    : 'changeIncidentType'
    'change [data-id="time-of-day"]'      : 'changeTimeOfDay'
    'click [data-id="categories-button"]' : 'showCategoryList'
    'click [data-id="close-categories"]'  : 'closeCategoryList'
    'click [data-id="filter-category"]'   : 'changeCategories'
    'click [data-id="deselect-all"]'      : 'deselectAllCategories'
    'click [data-id="select-chicago"]'    : 'renderChicagoMap'
    'click [data-id="select-seattle"]'    : 'renderSeattleMap'

  render: ->
    @$el.html(@template({categories: @incidentCategories.displayList()}))
    @renderMap()
    @renderLegendView()
    @createIncidents(new ChicagoConfig(@google))
    @

  renderChicagoMap: ->
    @chicagoConfig ?= new ChicagoConfig(@google)
    @incidents.setCityConfig(@chicagoConfig)
    @map = new @google.maps.Map(@$el.find('[data-id="map-canvas"]')[0], @chicagoConfig.mapOptions())
    @mapUtility = new MapUtility(@map, @google)
    @createIncidents(@chicagoConfig)

  renderSeattleMap: ->
    @seattleConfig ?= new SeattleConfig(@google)
    @incidents.setCityConfig(@seattleConfig)
    @map = new @google.maps.Map(@$el.find('[data-id="map-canvas"]')[0], @seattleConfig.mapOptions())
    @mapUtility = new MapUtility(@map, @google)
    @createIncidents(@seattleConfig)

  renderLegendView: ->
    @$el.find('[data-id="legend-container"]').html(new LegendView().render().$el)

  defaultMapOptions: ->
    center: new @google.maps.LatLng(41.833, -87.732)
    minZoom: 10
    zoom: 11

  renderMap: ->
    if !@map
      @map = new @google.maps.Map(@$el.find('[data-id="map-canvas"]')[0], @defaultMapOptions())
      @mapUtility = new MapUtility(@map, @google)

  createIncidents: (config) ->
    @displayLoading()
    @incidents.fetch
      reset: true
      success: (data) =>
        @incidents.setCityConfig(config)
        @removeLoading()
        @mapUtility.setUpIncidents(data, config)

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

  categoriesButton: ->
    @$el.find('[data-id="categories-button"]')

  categoriesContainer: ->
    @$el.find('[data-id="categories-container"]')

  checkedCategories: ->
    @$el.find('[name="category-checkbox"]:checked')

  showCategoryList: ->
    @categoriesButton().hide()
    @categoriesContainer().css('display', 'inline-block')

  closeCategoryList: ->
    @categoriesButton().show()
    @categoriesContainer().hide()

  changeCategories: ->
    @incidents.categoryArray = []
    _.each @checkedCategories(), (category) =>
      @incidents.categoryArray.push(@$el.find(category).data('category-name'))
    @createIncidents()

  deselectAllCategories: ->
    _.each @checkedCategories(), (category) =>
      @$el.find(category).prop('checked', false)

window.MainView = MainView
