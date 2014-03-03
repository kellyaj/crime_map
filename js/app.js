var map;
var incidents;
var mapUtils;
var incidentTypes;
mapUtils = new MapUtility();

function initialize() {
  var mapOptions = {
    center: new google.maps.LatLng(41.833, -87.732),
    minZoom: 10,
    zoom: 11
  };
  map = new google.maps.Map($('[data-id="map-canvas"]')[0], mapOptions);
  incidentTypes = new IncidentTypes();
}

google.maps.event.addDomListener(window, 'load', initialize);
legendView = new LegendView()
$('[data-id="legend-container"]').html(legendView.render().$el);

incidents = new Incidents();
incidents.fetch({
  success: function(data) {
    setUpIncidents(data);
  }
});

function setUpIncidents(data) {
  mapUtils.clearMarkers();
  _.each(data.models, function(incident) {
    incident.generateMarker(google, map);
    var incidentView = new InfoView({incident: incident, map: map, google: google});
    mapUtils.addMarker(incident.marker);
    google.maps.event.addListener(incident.marker, "click", function() {
      $('[data-id="info-container"]').html(incidentView.render().$el);
    });
  });
};

function renderFiltered(incidentCollection) {
  incidentType = $('[data-id="incident-type"] option:selected').data('incident-type');
  filteredCollection = new Incidents(incidentCollection.filterByType(incidentType));
  setUpIncidents(filteredCollection);
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

$('[data-id="about-button"]').click(function(event) {
  var aboutView = new AboutView();
  $('[data-id="about-button"]').hide();
  $('[data-id="about-container"]').show();
  $('[data-id="about-container"]').html(aboutView.render().$el);
});
