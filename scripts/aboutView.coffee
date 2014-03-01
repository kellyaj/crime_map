class AboutView extends Backbone.View

  template: JST['scripts/templates/about_view.ejs']

  events:
    'click [data-id="close-about"]' : 'closeView'

  className: "about-view"

  render: ->
    @$el.html(@template())
    @

  closeView: ->
    $('[data-id="about-button"]').show()
    $('[data-id="about-container"]').hide()

window.AboutView = AboutView
