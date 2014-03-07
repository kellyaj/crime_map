class Incidents extends Backbone.Collection

  initialize: (modelData)->
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
    "#{@resourceUrl}#{@sheet}.json?#{@generateRangeString()}"

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
