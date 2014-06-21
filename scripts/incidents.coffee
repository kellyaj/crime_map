class Incidents extends Backbone.Collection

  initialize: (modelData)->
    @categoryArray      = []
    @limit              = 25
    @offset             = 0
    @resourceUrl        = "https://data.cityofchicago.org/resource/"
    @sheet              = "ijzp-q8t2"
    @incidentCategories = new IncidentCategories()
    super(modelData)

  setCityConfig: (config) ->
    @config = config
    _.each @models, (model) ->
      model.setCityConfig(config)
    @incidentCategories.config = config
    @resourceUrl = config.resourceUrl()
    @sheet = config.sheet()

  url: ->
    @generateUrl()

  model: Incident

  setLimit: (newLimit) ->
    @limit = newLimit

  changeOffset: (offsetAmount) ->
    @offset += offsetAmount

  generateUrl: ->
    urlString = "#{@resourceUrl}#{@sheet}.json?#{@generateRangeString()}"
    if @categoryArray.length == 0
      urlString += @config.urlOptions()
    else
      urlString += @generateCategoryQuery()
      urlString += @config.urlOptions()

  generateCategoryQuery: ->
    lastIndex = @categoryArray.length - 1
    queryString = "&$where="
    _.each @categoryArray, (category, index) =>
      normalizedPrimary = @config.normalizedData()['primary_type']
      if index < lastIndex
        queryString += "#{normalizedPrimary}='#{category}' OR "
      else
        queryString += "#{normalizedPrimary}='#{category}'"
    queryString

  generateRangeString: ->
    "$limit=#{@limit}&$offset=#{@offset}"

  filterByType: (selectedType) ->
    if selectedType == "ALL"
      @models
    else
      @getModelsByType(selectedType)

  getModelsByType: (selectedType) ->
    incidents = @config.categories()[selectedType]
    _.filter this.models, (model) ->
      _.contains incidents, model.get('primary_type')

  filterByTimeOfDay: (selectedTime) ->
    if selectedTime == 'DAY'
      @dayIncidents()
    else if selectedTime == 'NIGHT'
      @nightIncidents()
    else
      @models

  dayIncidents: ->
    _.filter this.models, (model) ->
      model.get('time_of_day') == "day"

  nightIncidents: ->
    _.filter this.models, (model) ->
      model.get('time_of_day') == "night"


window.Incidents = Incidents
