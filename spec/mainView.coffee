describe 'MainView', ->

  beforeEach ->
    @fakeMap =
      setStreetView: ->
    @fakeGoogle =
      maps:
        StreetViewPanorama: ->
        LatLng: ->
        Map: ->
    @incidents =
      fetch: ->
    @view = new MainView
      google: @fakeGoogle
      incidents: @incidents

  it 'renders the nav and legend view', ->
    incidentSpy = spyOn(@incidents, 'fetch')
    @view.render()

    expect(@view.$el.find('[data-id=legend-container]').html()).toBeDefined()
    expect(@view.$el.find('[data-id=legend-container]').html()).not.toEqual("")
    expect(@view.$el.find('[data-id=incident-count]').html()).toBeDefined()
    expect(@view.$el.find('[data-id=incident-type]').html()).toBeDefined()
