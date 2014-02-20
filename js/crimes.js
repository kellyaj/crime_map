var Crimes = Backbone.Collection.extend({
  url: function() {
    return this.generateUrl();
  },

  model: Crime,

  initialize: function() {
    this.limit = 15;
    this.offset = 0;
    this.sheet = "qnmj-8ku6";
    this.resourceUrl = "https://data.cityofchicago.org/resource/"
  },

  setLimit: function(limit) {
    this.limit = limit;
  },

  changeOffset: function(amount) {
    this.offset += amount;
  },

  generateUrl: function() {
    return this.resourceUrl + this.sheet + ".json?" + this.generateRangeString();
  },

  generateRangeString: function() {
    return "$limit=" + this.limit + "&$offset=" + this.offset;
  },

  filterByType: function(incidentType) {
    return this.where({primary_type: incidentType});
  }
});
