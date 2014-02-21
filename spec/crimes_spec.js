describe('crime model', function() {

  var collection;
  var fakeCrimes;

  beforeEach(function() {
    fakeCrimes = [
      {"primary_type" : "ARSON"},
      {"primary_type" : "ARSON"},
      {"primary_type" : "HOMICIDE"},
      {"primary_type" : "ASSAULT"},
      {"primary_type" : "BATTERY"},
      {"primary_type" : "THEFT"},
      {"primary_type" : "STALKING"},
    ];
    collection = new Crimes(fakeCrimes);
  });

  it("sets the limit to a passed in value", function () {
    collection.setLimit(25);

    expect(collection.limit).toEqual(25);
  });

  it("increments the offset by a passed in value", function () {
    collection.changeOffset(50);

    expect(collection.offset).toEqual(50);
  });

  it("decrements the offset by a passed in value", function () {
    collection.changeOffset(50);
    collection.changeOffset(-10);

    expect(collection.offset).toEqual(40);
  });

  it("generates the url with limit, sheet, and range settings", function () {
    collection.setLimit(10);
    collection.changeOffset(10);
    collection.sheet = "someSheet"
    expectedUrl = "https://data.cityofchicago.org/resource/someSheet.json?$limit=10&$offset=10"
    expect(collection.generateUrl()).toEqual(expectedUrl);
  });

  it("returns all models if the incidentType is ALL", function () {
    expect(collection.filterByType("ALL").length).toEqual(fakeCrimes.length);
  });

  it("returns models for each category", function() {
    expect(collection.filterByType("VIOLENT").length).toEqual(3);
    expect(collection.filterByType("PROPERTY").length).toEqual(1);
    expect(collection.filterByType("PERSONAL").length).toEqual(1);
    expect(collection.filterByType("OTHER").length).toEqual(2);
  });
});
