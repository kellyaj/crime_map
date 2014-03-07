class Incident extends Backbone.Model

  initialize: (modelData) ->
    @incidentCategories = new IncidentCategories()
    @primaryType   = @get('primary_type')
    @setIncidentCategory()
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
    @incidentCategories.markerIcons()[@incidentCategory]

  formattedDate: ->
    splitData = @get('date').split("T")
    date = splitData[0]
    splitTime = splitData[1].split(":")
    time = [splitTime[0], splitTime[1]].join(":")
    dateSplit = date.split("-")
    dateTime = [dateSplit[1], dateSplit[2], dateSplit[0]].join("/") + " " + time
    result = ""
    if @isDayTime(time)
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

  isDayTime: (time) ->
    time < "22:00" && time >= "06:00"

window.Incident = Incident
