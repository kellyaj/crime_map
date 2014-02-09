var InfoView = Backbone.View.extend({

  initialize: function(options) {
    this.crime = options.crime;
  },

  render: function() {
    var template = _.template("<h1> <%= primary_description %></h1>");
    this.$el.html(template(this.displayData(this.crime)))
    return this;
  },

  displayData: function(model) {
    return {
      "primary_description": model.get('_primary_decsription')
    }
  }

});
