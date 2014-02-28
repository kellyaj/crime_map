class Incident extends Backbone.Model

  initialize: (modelData) ->
    @incidentTypes = new IncidentTypes()
    @primaryType = @get('primary_type')
    super(modelData)

  generateMarker: (google, map) ->
    @mapCoordinate = new google.maps.LatLng(this.get('latitude'), this.get('longitude'))
    @marker = new google.maps.Marker({
      icon: @getIcon(),
      position: @mapCoordinate,
      map: map,
      title: @get('primary_description')
    })
    @marker

  getIcon: ->
    @incidentTypes.markerIcon[@incidentCategory]

  formattedDate: ->
    splitData = @get('date').split("T")
    date = splitData[0]
    splitTime = splitData[1].split(":")
    time = [splitTime[0], splitTime[1]].join(":")
    dateSplit = date.split("-")
    dateTime = [dateSplit[1], dateSplit[2], dateSplit[0]].join("/") + " " + time
    if @isDayTime(time)
      dateTime += '<span class="icon-sun"></span>'
    else
      dateTime += '<span class="icon-moon"></span>'
    dateTime

  setIncidentCategory: ->
    if @incidentTypes.isViolent(@primaryType)
      @incidentCategory = "VIOLENT"
    else if @incidentTypes.isProperty(@primaryType)
      @incidentCategory = "PROPERTY"
    else if @incidentTypes.isPersonal(@primaryType)
      @incidentCategory = "PERSONAL"
    else
      @incidentCategory = "OTHER"

  isDayTime: (time) ->
    time < "22:00" && time >= "06:00"

window.Incident = Incident
