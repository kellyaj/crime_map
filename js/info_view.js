var InfoView = Backbone.View.extend({

  initialize: function(options) {
    this.crime = options.crime;
  },

  render: function() {
    var template = _.template(
                  "<h1> <%= primary_description %></h1><h2> <%= secondary_description %></h2><h3> <%= location_description %> </h3>"
                  );
    this.$el.html(template(this.displayData(this.crime)))
    return this;
  },

  displayData: function(model) {
    return {
      "primary_description": model.get('_primary_decsription'),
      "secondary_description": model.get('_secondary_description'),
      "location_description": model.get('_location_description')
    }
  }

});
