var map;

function initialize() {
  var mapOptions = {
    zoom: 11,
    center: new google.maps.LatLng(41.833, -87.732)
  };
  map = new google.maps.Map($('[data-id="map-canvas"]')[0], mapOptions);

  var plat = 41.78948420770715;
  var plong = -87.7232068260961;

  var place = new google.maps.LatLng(41.78948420770715, -87.7232068260961)
  var place1 = new google.maps.LatLng(41.736380815144884, -87.62763512088614)

  var marker = new google.maps.Marker({
    position: place,
    map: map,
    title: "thing"
  });

  streetviewUrl = "http://maps.googleapis.com/maps/api/streetview?size=300x300&location=" + plat + "," + plong + "&fov=90&heading=235&pitch=10&sensor=false"
  var infowindow = new google.maps.InfoWindow({
    content: "<h1>Motor Vehicle Theft</h1><h2>AUTOMOBILE</h2><img src='" + streetviewUrl + "'>"
  });

  var marker1 = new google.maps.Marker({
    position: place1,
    map: map,
    title: "thing"
  });

  google.maps.event.addListener(marker1, "click", function() {
    infowindow.open(map, marker1);
  });
}

google.maps.event.addDomListener(window, 'load', initialize);

var crimes = new Crimes();
crimes.fetch({
  success: function(data) {
    console.log(crimes);
  }
});
