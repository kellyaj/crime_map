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
    'click [data-id="city-select"]'       : 'renderNewCity'

  render: ->
    @currentConfig ?= new ChicagoConfig(@google)
    @$el.html(@template({categories: @currentConfig.categoryDisplayList()}))
    @renderDefaultMap()
    @createIncidents(@currentConfig)
    @

  renderNewCity: (event) ->
    @currentConfig = @getConfigFor($(event.target).data('city'))
    @$el.html(@template({categories: @currentConfig.categoryDisplayList()}))
    @map = new @google.maps.Map(@$el.find('[data-id="map-canvas"]')[0], @currentConfig.mapOptions())
    @mapUtility.map = @map
    @renderLegendView()
    @createIncidents(@currentConfig)

  getConfigFor: (cityName) ->
    if cityName == "chicago"
      @chicagoConfig ?= new ChicagoConfig(@google)
    else
      @seattleConfig ?= new SeattleConfig(@google)

  renderLegendView: ->
    @$el.find('[data-id="legend-container"]').html(new LegendView().render().$el)

  renderDefaultMap: ->
    @map = new @google.maps.Map(@$el.find('[data-id="map-canvas"]')[0], @currentConfig.mapOptions())
    @mapUtility = new MapUtility(@map, @google)
    @renderLegendView()

  createIncidents: (config) ->
    @incidents.setCityConfig(config)
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
    @createIncidents(@currentConfig)

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
    @createIncidents(@currentConfig)

  deselectAllCategories: ->
    _.each @checkedCategories(), (category) =>
      @$el.find(category).prop('checked', false)

window.MainView = MainView
