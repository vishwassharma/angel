(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['libs/models/collection', 'startups/model'], function(Collection, Startup) {
    var StartupList, startupList;
    StartupList = (function(_super) {

      __extends(StartupList, _super);

      function StartupList() {
        return StartupList.__super__.constructor.apply(this, arguments);
      }

      StartupList.prototype.url = '/api/startups/';

      StartupList.prototype.model = Startup;

      return StartupList;

    })(Collection);
    startupList = new StartupList;
    return startupList;
  });

}).call(this);
