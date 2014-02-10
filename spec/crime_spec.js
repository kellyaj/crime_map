describe('crime model', function() {

  var fakeCrime = {
    "case_number" : "HX135149",
    "beat" : "0822",
    "location" : {
      "needs_recoding" : false,
      "longitude" : "-87.70856015252158",
      "latitude" : "41.79185339253908"
    },
    "x_coordinate" : "1154624",
    "block" : "055XX S HOMAN AVE",
    "primary_type" : "ARSON",
    "location_description" : "RESIDENCE",
    "date" : "2014-02-01T05:00:00",
    "iucr" : "0486",
    "domestic" : true,
    "id" : "9481932",
    "ward" : "14",
    "arrest" : false,
    "description" : "IT GOT HOT",
    "y_coordinate" : "1867361",
    "updated_on" : "2014-02-04T00:39:03",
    "fbi_code" : "08B",
    "longitude" : "-87.70856015252158",
    "year" : "2014",
    "community_area" : "63",
    "latitude" : "41.79185339253908",
    "district" : "008"
  };

  var fakeGoogle = {
    maps: {}
  }
  fakeGoogle.maps.LatLng = function(){};
  fakeGoogle.maps.Marker = function(){};

  it("generates a google maps marker based on its information", function () {
    var crime = new Crime("fake map", fakeCrime);

    crime.generateMarker(fakeGoogle);

    expect(crime.marker).toBeDefined();
  });
});