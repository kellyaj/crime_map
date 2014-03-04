class LegendView extends Backbone.View

  initialize: ->
    @incidentCategories = new IncidentCategories()

  template: JST['scripts/templates/legend_view.ejs']

  className: "legend-view"

  render: ->
    @$el.html(@template(@displayData()))
    @

  displayData: ->
    'violent_icon_url'  : @incidentCategories.markerIcons()["VIOLENT"]
    'property_icon_url' : @incidentCategories.markerIcons()["PROPERTY"]
    'personal_icon_url' : @incidentCategories.markerIcons()["PERSONAL"]
    'other_icon_url'    : @incidentCategories.markerIcons()["OTHER"]

window.LegendView = LegendView
