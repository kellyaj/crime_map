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
      setCityConfig: (config) ->
        @config = config
    @view = new MainView
      google: @fakeGoogle
      incidents: @incidents
    @incidentSpy = spyOn(@incidents, 'fetch')

  it 'renders the nav and legend view', ->
    @view.render()

    expect(@view.$el.find('[data-id=legend-container]').html()).toBeDefined()
    expect(@view.$el.find('[data-id=legend-container]').html()).not.toEqual("")
    expect(@view.$el.find('[data-id=incident-count]').html()).toBeDefined()
    expect(@view.$el.find('[data-id=incident-type]').html()).toBeDefined()

  it 'fetches incidents on render', ->
    @view.render()

    expect(@incidentSpy).toHaveBeenCalled()

  it 'renders the map via the google API', ->
    mapSpy = spyOn(@fakeGoogle.maps, 'Map')
    @view.render()

    expect(mapSpy).toHaveBeenCalled()

  it 'switches city config when other city is clicked', ->
    seattleSheet = "7ais-f98f"
    chicagoSheet = "qnmj-8ku6"
    @view.render()

    @view.$el.find('[data-city="seattle"]').click()

    expect(@view.currentConfig.sheet()).toBe(seattleSheet)
    expect(@view.incidents.config.sheet()).toBe(seattleSheet)

    @view.$el.find('[data-city="chicago"]').click()

    expect(@view.currentConfig.sheet()).toBe(chicagoSheet)
    expect(@view.incidents.config.sheet()).toBe(chicagoSheet)
