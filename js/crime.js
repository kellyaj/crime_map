var Crime = Backbone.Model.extend({

  generateMarker: function(google, map) {
    this.mapCoordinate = new google.maps.LatLng(this.get('latitude'), this.get('longitude'))
    this.marker = new google.maps.Marker({
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

});
