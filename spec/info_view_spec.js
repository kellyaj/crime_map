describe('infoView', function() {

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
  var crimeModel = new Backbone.Model(fakeCrime);

  it("renders with basic crime info", function () {
    var view = new InfoView({crime: crimeModel});
    view.render();

    expect(view.$el.html()).toContain("ARSON");
    expect(view.$el.html()).toContain("IT GOT HOT");
    expect(view.$el.html()).toContain("RESIDENCE");
  });

  it("displays arrest status", function () {
    crimeModel.set('arrest', false);
    var view = new InfoView({crime: crimeModel});

    view.render();

    expect(view.$el.html()).toContain("NO ARREST");
  });

  it("formats arrest data for display when there was an arrest", function () {
    crimeModel.set('arrest', true);
    var view = new InfoView({crime: crimeModel});
    expect(view.formatArrestData()).toEqual('<div class="arrest-made">ARREST MADE</div>');
  });

  it("formats arrest data for display when no arrest", function () {
    crimeModel.set('arrest', false);
    var view = new InfoView({crime: crimeModel});
    expect(view.formatArrestData()).toEqual('<div class="no-arrest">NO ARREST</div>');
  });

  it("creates a streetviewUrl from the lat/long", function () {
    var view = new InfoView({crime: crimeModel});
    long = crimeModel.get('longitude');
    lat = crimeModel.get('latitude');
    expectedUrl = "http://maps.googleapis.com/maps/api/streetview?size=300x300&location=" + lat + "," + long + "&fov=90&heading=235&pitch=10&sensor=false"
    expect(view.streetviewUrl()).toEqual(expectedUrl);
  });

});
