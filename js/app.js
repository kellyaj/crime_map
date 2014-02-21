var map;
var crimes;
var mapUtils;
var incidentTypes;

function initialize() {
  var mapOptions = {
    zoom: 11,
    center: new google.maps.LatLng(41.833, -87.732)
  };
  map = new google.maps.Map($('[data-id="map-canvas"]')[0], mapOptions);
  mapUtils = new MapUtility(map);
  incidentTypes = new IncidentTypes();
}

google.maps.event.addDomListener(window, 'load', initialize);

crimes = new Crimes();
crimes.fetch({
  success: function(data) {
    setUpCrimes(data);
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
      place = new google.maps.LatLng(crime.get('latitude'), crime.get('longitude'))
      var panorama = new google.maps.StreetViewPanorama($('[data-id="pano"]')[0], {position: place});
      map.setStreetView(panorama);
    });
  });
};

function renderFiltered(crimeCollection) {
  incidentType = $('[data-id="incident-type"] option:selected').data('incident-type');
  filteredCollection = new Crimes(crimeCollection.filterByType(incidentType));
  setUpCrimes(filteredCollection);
};

$('[data-id="incident-count"]').change(function(event) {
  var newLimit = $('[data-id="incident-count"] option:selected').data('count');
  crimes.setLimit(newLimit);
  crimes.fetch({
    reset: true,
    success: function() {
      renderFiltered(crimes);
    }
  });
});

$('[data-id="incident-type"]').change(function(event) {
  renderFiltered(crimes);
});
