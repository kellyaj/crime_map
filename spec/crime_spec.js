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

  _createCrime = function(primaryType) {
    var newCrime = new Crime({"primary_type": primaryType});
    newCrime.setIncidentCategory();
    return newCrime;
  }
  it("generates a google maps marker based on its information", function () {
    var crime = new Crime(fakeCrime);

    crime.generateMarker(fakeGoogle);

    expect(crime.marker).toBeDefined();
  });

  it("formats the date into human readable format", function () {
    var crime = new Crime(fakeCrime);

    expect(crime.formattedDate()).toContain("02/01/2014 05:00");
  });

  it("sets the incidentCategory based on the primaryType", function () {
    var violentCrime = _createCrime("ASSAULT");
    var personalCrime = _createCrime("STALKING");
    var propertyCrime = _createCrime("THEFT");
    var otherCrime = _createCrime("ARSON");
    expect(violentCrime.incidentCategory).toEqual("VIOLENT");
    expect(personalCrime.incidentCategory).toEqual("PERSONAL");
    expect(propertyCrime.incidentCategory).toEqual("PROPERTY");
    expect(otherCrime.incidentCategory).toEqual("OTHER");
  });

  it("considers day as between 06:00 and 22:00", function () {
    var crime = new Crime(fakeCrime);

    expect(crime.isDayTime("05:59")).toEqual(false);
    expect(crime.isDayTime("06:00")).toEqual(true);
    expect(crime.isDayTime("21:59")).toEqual(true);
    expect(crime.isDayTime("22:00")).toEqual(false);
    expect(crime.isDayTime("03:45")).toEqual(false);
  });
});
