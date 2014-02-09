describe('infoView', function() {

  it("renders with basic crime info", function () {
    var fakeCrime = {
      _iucr: "0486",
      _location_description: "APARTMENT",
      _primary_decsription: "ARSON",
      _secondary_description: "IT GOT HOT",
      arrest: "Y",
      beat: "2531",
      block: "056XX W WABANSIA AVE",
      case_: "HW148033",
      date_of_occurrence: "2013-02-07T17:25:00",
      domestic: "Y",
      fbi_cd: "08B",
      ward: "29",
      x_coordinate: "1138757",
      y_coordinate: "1910703",
    };
    crimeModel = new Backbone.Model(fakeCrime);
    var view = new InfoView({crime: crimeModel});
    view.render();

    expect(view.$el.html()).toContain("ARSON");
  });

});
