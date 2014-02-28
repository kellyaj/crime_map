class Incidents extends Backbone.Collection

  initialize: (modelData)->
    @limit = 25
    @offset = 0
    @resourceUrl = "https://data.cityofchicago.org/resource/"
    @sheet = "qnmj-8ku6"
    @incidentTypes = new IncidentTypes()
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
    incidents = @incidentTypes.category[selectedType]
    _.filter this.models, (model) ->
      _.contains incidents, model.get('primary_type')


window.Incidents = Incidents
