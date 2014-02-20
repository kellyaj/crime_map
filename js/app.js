var map;
var crimes;
var mapUtils;

function initialize() {
  var mapOptions = {
    zoom: 11,
    center: new google.maps.LatLng(41.833, -87.732)
  };
  map = new google.maps.Map($('[data-id="map-canvas"]')[0], mapOptions);
  mapUtils = new MapUtility(map);
}

google.maps.event.addDomListener(window, 'load', initialize);

crimes = new Crimes();
crimes.fetch({
  success: function(data) {
    _.each(crimes.models, function(crime) {
      crime.generateMarker(google, map);
      var crimeView = new InfoView({crime: crime});
      mapUtils.addMarker(crime.marker);
      google.maps.event.addListener(crime.marker, "click", function() {
        $('[data-id="info-container"]').html(crimeView.render().$el);
      });
    });
  }
});
