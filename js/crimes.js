var limit = "25";
var rangeString = "$limit= " + limit + "&$offset=0";
var sheet = "qnmj-8ku6"

var Crimes = Backbone.Collection.extend({
  url: "https://data.cityofchicago.org/resource/" + sheet + ".json?" + rangeString,
  model: Crime
});
