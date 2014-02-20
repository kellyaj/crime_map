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
  setUpCrimes(data)
  }
});

function setUpCrimes(data) {
  mapUtils.clearMarkers();
  _.each(data.models, function(crime) {
    crime.generateMarker(google, map);
    var crimeView = new InfoView({crime: crime});
    mapUtils.addMarker(crime.marker);
    google.maps.event.addListener(crime.marker, "click", function() {
      $('[data-id="info-container"]').html(crimeView.render().$el);
    });
  });
};

$('[data-id="incident-count"]').change(function(event) {
  var newLimit = $('[data-id="incident-count"] option:selected').data('count');
  crimes.setLimit(newLimit);
  mapUtils.clearMarkers();
  crimes.fetch({
    reset: true,
    success: function(data) {
      incidentType = $('[data-id="incident-type"] option:selected').data('incident-type');
      filteredData = data.filterByType(incidentType);
      setUpCrimes(data);
    }
  });
});

$('[data-id="incident-type"]').change(function(event) {
  var newIncidentType = $('[data-id="incident-type"] option:selected').data('incident-type');
  var newCrimes = new Crimes(crimes.filterByType(newIncidentType));
  mapUtils.clearMarkers();
  setUpCrimes(newCrimes);
});
