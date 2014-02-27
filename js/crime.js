var Crime = Backbone.Model.extend({

  initialize: function() {
    this.incidentTypes = new IncidentTypes();
    this.primaryType = this.get('primary_type');
    this.setIncidentCategory();
  },

  generateMarker: function(google, map) {
    this.mapCoordinate = new google.maps.LatLng(this.get('latitude'), this.get('longitude'));
    this.marker = new google.maps.Marker({
      icon: this.getIcon(),
      position: this.mapCoordinate,
      map: map,
      title: this.get('primary_description')
    });
    return this.marker;
  },

  formattedDate: function() {
    var splitData = this.get('date').split("T");
    var date = splitData[0];
    var splitTime = splitData[1].split(":");
    var time = [splitTime[0], splitTime[1]].join(":");
    var dateSplit = date.split("-");
    var dateTime = [dateSplit[1], dateSplit[2], dateSplit[0]].join("/") + " " + time;
    if (this.isDayTime(time)) {
      dateTime += '<span class="icon-sun"></span>'
    } else {
      dateTime += '<span class="icon-moon"></span>'
    }
    return dateTime;
  },

  isDayTime: function(time) {
    return time < "22:00" && time >= "06:00";
  },

  setIncidentCategory: function() {
    if (this.incidentTypes.isViolent(this.primaryType)) {
      this.incidentCategory = "VIOLENT"
    } else if (this.incidentTypes.isProperty(this.primaryType)) {
      this.incidentCategory = "PROPERTY"
    } else if (this.incidentTypes.isPersonal(this.primaryType)) {
      this.incidentCategory = "PERSONAL"
    } else {
      this.incidentCategory = "OTHER"
    }
  },

  getIcon: function() {
    return this.incidentTypes.markerIcon[this.incidentCategory];
  }

});
