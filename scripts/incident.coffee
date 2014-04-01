class Incident extends Backbone.Model

  initialize: (modelData) ->
    @incidentCategories = new IncidentCategories()
    @setIncidentCategory()
    @setTimeOfDay()
    super(modelData)

  setCityConfig: (cityConfig) ->
    @dataFor = cityConfig.normalizedData()
    @primaryType = @get(@dataFor['primary_type'])

  generateMarker: (google, map) ->
    @mapCoordinate = new google.maps.LatLng(@get(@dataFor['latitude']), @get(@dataFor['longitude']))
    @marker = new google.maps.Marker({
      icon: @getIcon(),
      position: @mapCoordinate,
      map: map,
      title: @get(@dataFor['primary_description'])
    })
    @marker

  getIcon: ->
    @incidentCategories.markerIcons()[@incidentCategory]

  getTime: =>
    splitTime = @get('date').split("T")[1].split(":")
    [splitTime[0], splitTime[1]].join(":")

  formattedDate: =>
    console.log @dataFor
    dateSplit = @get('date').split("T")[0].split("-")
    time = @getTime()
    dateTime = "#{dateSplit[1]}/#{dateSplit[2]}/#{dateSplit[0]} #{time}"
    result = ""
    if @get('time_of_day') == 'day'
      result += '<span class="icon-sun info-view-icon"></span>'
    else
      result += '<span class="icon-moon info-view-icon"></span>'
    result += dateTime

  setIncidentCategory: ->
    if @incidentCategories.isViolent(@primaryType)
      @incidentCategory = "VIOLENT"
    else if @incidentCategories.isProperty(@primaryType)
      @incidentCategory = "PROPERTY"
    else if @incidentCategories.isPersonal(@primaryType)
      @incidentCategory = "PERSONAL"
    else
      @incidentCategory = "OTHER"

  setTimeOfDay: ->
    if @isDayTime(@getTime())
      @set('time_of_day', 'day')
    else
      @set('time_of_day', 'night')

  isDayTime: (time) ->
    time < "22:00" && time >= "06:00"

window.Incident = Incident
