var InfoView = Backbone.View.extend({

  initialize: function(options) {
    this.crime = options.crime;
  },

  template: JST['js/templates/info_view.ejs'],

  render: function() {
    this.$el.html(this.template(this.displayData(this.crime)))
    return this;
  },

  displayData: function(model) {
    return {
      "primary_type"          : model.get('primary_type'),
      "description"           : model.get('description'),
      "location_description"  : model.get('location_description'),
      "streetviewUrl"         : this.streetviewUrl(),
      "arrest_status"         : this.formatArrestData(),
      "incident_date"         : model.formattedDate()
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
