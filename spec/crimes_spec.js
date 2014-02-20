describe('crime model', function() {

  var collection;
  var fakeCrimes;

  beforeEach(function() {
    fakeCrimes = [
      {"primary_type" : "ARSON"},
      {"primary_type" : "HOMICIDE"},
      {"primary_type" : "ARSON"},
      {"primary_type" : "THEFT"},
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

  it("filters the collection based on primary incident type", function () {
    expect(collection.filterByType("ARSON").length).toEqual(2);
    expect(collection.filterByType("THEFT").length).toEqual(1);
    expect(collection.filterByType("ROBBERY").length).toEqual(0);
  });
});
