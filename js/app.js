var map;
var crimes;

function initialize() {
  var mapOptions = {
    zoom: 11,
    center: new google.maps.LatLng(41.833, -87.732)
  };
  map = new google.maps.Map($('[data-id="map-canvas"]')[0], mapOptions);
}

google.maps.event.addDomListener(window, 'load', initialize);

crimes = new Crimes();
crimes.fetch({
  success: function(data) {
    _.each(crimes.models, function(crime) {
      crime.generateMarker(google, map);
      var crimeView = new InfoView({crime: crime});
      var crimeWindow = new google.maps.InfoWindow({
        content: crimeView.render().$el.html()
      });
      google.maps.event.addListener(crime.marker, "click", function() {
        crimeWindow.open(map, crime.marker);
      });
    });
  }
});
