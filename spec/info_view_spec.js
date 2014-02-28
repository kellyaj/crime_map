describe('infoView', function() {

  var fakeIncident = {
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
  var fakeMap = {}
  var fakeGoogle = {
    maps: {},
  }
  fakeGoogle.maps.StreetViewPanorama = function(){};
  fakeGoogle.maps.LatLng = function(){};
  fakeMap.setStreetView = function(){};
  var crimeModel = new Incident(fakeIncident);

  it("renders with basic crime info", function () {
    var view = new InfoView({incident: crimeModel, map: fakeMap, google: fakeGoogle});
    view.render();

    expect(view.$el.html()).toContain("ARSON");
    expect(view.$el.html()).toContain("IT GOT HOT");
    expect(view.$el.html()).toContain("RESIDENCE");
    expect(view.$el.html()).toContain("02/01/2014");
  });

  it("displays arrest status", function () {
    crimeModel.set('arrest', false);
    var view = new InfoView({incident: crimeModel, map: fakeMap, google: fakeGoogle});

    view.render();

    expect(view.$el.html()).toContain("NO ARREST");
  });

  it("formats arrest data for display when there was an arrest", function () {
    crimeModel.set('arrest', true);
    var view = new InfoView({incident: crimeModel});
    expect(view.formatArrestData()).toContain('<div class="arrest-made">');
  });

  it("formats arrest data for display when no arrest", function () {
    crimeModel.set('arrest', false);
    var view = new InfoView({incident: crimeModel});
    expect(view.formatArrestData()).toContain('<div class="no-arrest">');
  });

});
