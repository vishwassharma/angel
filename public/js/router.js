(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['mediator', 'startups/views'], function(mediator, StartupView) {
    var AppRouter;
    AppRouter = (function(_super) {

      __extends(AppRouter, _super);

      function AppRouter() {
        return AppRouter.__super__.constructor.apply(this, arguments);
      }

      AppRouter.prototype.routes = {
        '!/': 'home',
        '!/startups': 'startups',
        '!/talents': 'talents',
        '!/investors': 'investors',
        '*actions': 'defaultAction'
      };

      AppRouter.prototype.home = function() {
        return console.log("homepage");
      };

      AppRouter.prototype.startups = function() {
        var startupView;
        console.log("startup page");
        startupView = new StartupView();
        return console.log(startupView.render());
      };

      AppRouter.prototype.talents = function() {
        return console.log("talents");
      };

      AppRouter.prototype.investors = function() {
        return console.log("investors");
      };

      AppRouter.prototype.defaultAction = function(actions) {
        return console.log("Default view");
      };

      AppRouter.prototype.initialize = function() {
        console.log("Initialize AppRouter");
        return this.initHistory();
      };

      AppRouter.prototype.initHistory = function() {
        console.log("Starting browser history");
        Backbone.history.start();
        return this.navigate();
      };

      return AppRouter;

    })(Backbone.Router);
    return AppRouter;
  });

}).call(this);
