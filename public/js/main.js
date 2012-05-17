(function() {

  require.config({
    baseUrl: '/js/',
    paths: {
      text: 'libs/text'
    },
    waitSeconds: 1,
    urlArgs: 'bust=' + (new Date()).getTime()
  });

  require(['app'], function(Application) {
    var application;
    console.log("Working on application");
    return application = new Application;
  });

}).call(this);
