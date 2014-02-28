var map;
var incidents;
var mapUtils;
var incidentTypes;

function initialize() {
  var mapOptions = {
    center: new google.maps.LatLng(41.833, -87.732),
    minZoom: 10,
    zoom: 11
  };
  map = new google.maps.Map($('[data-id="map-canvas"]')[0], mapOptions);
  mapUtils = new MapUtility(map);
  incidentTypes = new IncidentTypes();
}

google.maps.event.addDomListener(window, 'load', initialize);

incidents = new Incidents();
incidents.fetch({
  success: function(data) {
    setUpCrimes(data);
  }
});

function setUpCrimes(data) {
  mapUtils.clearMarkers();
  _.each(data.models, function(crime) {
    crime.generateMarker(google, map);
    var crimeView = new InfoView({crime: crime, map: map, google: google});
    mapUtils.addMarker(crime.marker);
    google.maps.event.addListener(crime.marker, "click", function() {
      $('[data-id="info-container"]').html(crimeView.render().$el);
    });
  });
};

function renderFiltered(crimeCollection) {
  incidentType = $('[data-id="incident-type"] option:selected').data('incident-type');
  filteredCollection = new Incidents(crimeCollection.filterByType(incidentType));
  setUpCrimes(filteredCollection);
};

$('[data-id="incident-count"]').change(function(event) {
  $('[data-id="flash"]').html("LOADING...");
  var newLimit = $('[data-id="incident-count"] option:selected').data('count');
  incidents.setLimit(newLimit);
  incidents.fetch({
    reset: true,
    success: function() {
      $('[data-id="flash"]').fadeOut("slow", function() {
        $('[data-id="flash"]').empty();
        $('[data-id="flash"]').css('display', 'inline-block');
      });
      renderFiltered(incidents);
    }
  });
});

$('[data-id="incident-type"]').change(function(event) {
  renderFiltered(incidents);
});
