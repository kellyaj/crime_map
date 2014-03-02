class LegendView extends Backbone.View

  initialize: ->
    @incidentTypes = new IncidentTypes()

  template: JST['scripts/templates/legend_view.ejs']

  className: "legend-view"

  render: ->
    @$el.html(@template(@displayData()))
    @

  displayData: ->
    'violent_icon_url'  : @incidentTypes.markerIcon["VIOLENT"]
    'property_icon_url' : @incidentTypes.markerIcon["PROPERTY"]
    'personal_icon_url' : @incidentTypes.markerIcon["PERSONAL"]
    'other_icon_url'    : @incidentTypes.markerIcon["OTHER"]

window.LegendView = LegendView
