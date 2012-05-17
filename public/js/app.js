(function() {

  define(['mediator', 'router'], function(mediator, AppRouter) {
    var Application;
    Application = (function() {

      function Application() {
        console.log("Creating new application");
        this.initRouter();
      }

      Application.prototype.initRouter = function() {
        console.log("Defining router");
        mediator.router = new AppRouter();
        return typeof Object.defineProperty === "function" ? Object.defineProperty(mediator, 'router', {
          writable: false
        }) : void 0;
      };

      /*
                  Controllers can communicate through Pub/Sub methods
      */


      Application.prototype.initControllers = function() {
        return console.log("Initialize other controllers");
      };

      return Application;

    })();
    if (typeof Object.freeze === "function") {
      Object.freeze(Application);
    }
    return Application;
  });

}).call(this);
