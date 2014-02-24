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
    var date = this.get('date').split("T")[0];
    var dateSplit = date.split("-");
    return [dateSplit[1], dateSplit[2], dateSplit[0]].join("/");
  },

  setIncidentCategory: function() {
    if (_.contains(this.incidentTypes.category["VIOLENT"], this.primaryType)) {
      this.incidentCategory = "VIOLENT"
    } else if (_.contains(this.incidentTypes.category["PROPERTY"], this.primaryType)) {
      this.incidentCategory = "PROPERTY"
    } else if (_.contains(this.incidentTypes.category["PERSONAL"], this.primaryType)) {
      this.incidentCategory = "PERSONAL"
    } else {
      this.incidentCategory = "OTHER"
    }
  },

  getIcon: function() {
    return this.incidentTypes.markerIcon[this.incidentCategory];
  }

});
