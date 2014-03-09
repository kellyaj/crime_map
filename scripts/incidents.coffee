class Incidents extends Backbone.Collection

  initialize: (modelData)->
    @categoryArray      = []
    @limit              = 25
    @offset             = 0
    @resourceUrl        = "https://data.cityofchicago.org/resource/"
    @sheet              = "qnmj-8ku6"
    @incidentCategories = new IncidentCategories()
    super(modelData)

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
      urlString
    else
      urlString += @generateCategoryQuery()

  generateCategoryQuery: ->
    lastIndex = @categoryArray.length - 1
    queryString = "&$where="
    _.each @categoryArray, (category, index) ->
      if index < lastIndex
        queryString += "primary_type='#{category}' OR "
      else
        queryString += "primary_type='#{category}'"
    queryString

  generateRangeString: ->
    "$limit=#{@limit}&$offset=#{@offset}"

  filterByType: (selectedType) ->
    if selectedType == "ALL"
      @models
    else
      @getModelsByType(selectedType)

  getModelsByType: (selectedType) ->
    incidents = @incidentCategories.primary()[selectedType]
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
