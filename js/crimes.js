var limit = "25";
var rangeString = "$limit= " + limit + "&$offset=0";

var Crimes = Backbone.Collection.extend({
  url: "https://data.cityofchicago.org/resource/x2n5-8w5q.json?" + rangeString
});
