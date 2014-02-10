var InfoView = Backbone.View.extend({

  initialize: function(options) {
    this.crime = options.crime;
  },

  render: function() {
    var template = _.template(
                  "<h1> <%= primary_type %></h1><h2> <%= description %></h2><h3> <%= location_description %> <%= arrest_status %></h3> </h3><img src=<%= streetviewUrl %>>"
                  );
    this.$el.html(template(this.displayData(this.crime)))
    return this;
  },

  displayData: function(model) {
    return {
      "primary_type": model.get('primary_type'),
      "description": model.get('description'),
      "location_description": model.get('location_description'),
      "streetviewUrl": this.streetviewUrl(),
      "arrest_status": this.formatArrestData()
    }
  },

  streetviewUrl: function() {
    return "http://maps.googleapis.com/maps/api/streetview?size=300x300&location=" + this.crime.get('latitude') + "," + this.crime.get('longitude') + "&fov=90&heading=235&pitch=10&sensor=false"
  },

  formatArrestData: function() {
    if (this.crime.get('arrest')) {
      return '<div class="arrest-made">ARREST MADE</div>';
    } else {
      return '<div class="no-arrest">NO ARREST</div>';
    }
  },

});
