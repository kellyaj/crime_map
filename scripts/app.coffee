$ ->
  mainView = new MainView({google: google, incidents: new Incidents()})
  $('[data-id="main-container"]').html(mainView.render().$el)
