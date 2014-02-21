var InfoView = Backbone.View.extend({

  initialize: function(options) {
    this.crime = options.crime;
    this.google = options.google;
    this.map = options.map;
  },

  template: JST['js/templates/info_view.ejs'],

  render: function() {
    this.$el.html(this.template(this.displayData(this.crime)));
    this.renderStreetView();
    return this;
  },

  displayData: function(model) {
    return {
      "primary_type"          : model.get('primary_type'),
      "description"           : model.get('description'),
      "location_description"  : model.get('location_description'),
      "arrest_status"         : this.formatArrestData(),
      "incident_date"         : model.formattedDate()
    }
  },

  formatArrestData: function() {
    if (this.crime.get('arrest')) {
      return '<div class="arrest-made">ARREST MADE</div>';
    } else {
      return '<div class="no-arrest">NO ARREST</div>';
    }
  },

  renderStreetView: function() {
    var place = new this.google.maps.LatLng(this.crime.get('latitude'), this.crime.get('longitude'))
    var panorama = new this.google.maps.StreetViewPanorama(this.$el.find('[data-id="pano"]')[0], {position: place, disableDefaultUI: true});
    this.map.setStreetView(panorama);
  }

});
