$ ->

  mapOptions =
    center: new google.maps.LatLng(41.833, -87.732)
    minZoom: 10
    zoom: 11
  map = new google.maps.Map($('[data-id="map-canvas"]')[0], mapOptions)

  @mapUtility = new MapUtility(map, google)
  legendView = new LegendView()
  $('[data-id="legend-container"]').html(legendView.render().$el)

  incidents = new Incidents()
  incidents.fetch({
    success: (data) =>
      @mapUtility.setUpIncidents(data)
  })


  $('[data-id="incident-count"]').change =>
    $('[data-id="flash"]').html("LOADING...")
    newLimit = $('[data-id="incident-count"] option:selected').data('count')
    incidents.setLimit(newLimit)
    incidents.fetch({
      reset: true,
      success: =>
        $('[data-id="flash"]').fadeOut("slow", ->
          $('[data-id="flash"]').empty()
          $('[data-id="flash"]').css('display', 'inline-block')
        )
        @mapUtility.renderFiltered(incidents)
  })

  $('[data-id="incident-type"]').change (event) =>
    @mapUtility.renderFiltered(incidents)

  $('[data-id="about-button"]').click (event) ->
    aboutView = new AboutView()
    $('[data-id="about-button"]').hide()
    $('[data-id="about-container"]').show()
    $('[data-id="about-container"]').html(aboutView.render().$el)
