var InfoView = Backbone.View.extend({

  initialize: function(options) {
    this.crime = options.crime;
  },

  render: function() {
    this.$el.html("<h1>Hello</h1>")
    return this;
  }

});
