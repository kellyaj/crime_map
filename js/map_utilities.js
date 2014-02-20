var MapUtility = function(map){
  this.map = map;
  this.markers = [];
};

MapUtility.prototype.setAllMarkers = function(map) {
  _.each(this.markers, function(marker) {
    marker.setMap(map);
  });
}

MapUtility.prototype.clearMarkers = function() {
  var _this = this;
  _.each(this.markers, function(marker) {
    _this.setAllMarkers(null);
  });
}

MapUtility.prototype.addMarker = function(marker) {
  this.markers.push(marker);
}
