var Crime = Backbone.Model.extend({

  generateMarker: function(google, map) {
    this.mapCoordinate = new google.maps.LatLng(this.get('latitude'), this.get('longitude'))
    this.marker = new google.maps.Marker({
      position: this.mapCoordinate,
      map: map,
      title: this.get('primary_description')
    });
    return this.marker;
  }

});
