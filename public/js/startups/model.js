(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['libs/models/model'], function(Model) {
    var Startup;
    Startup = (function(_super) {

      __extends(Startup, _super);

      function Startup() {
        return Startup.__super__.constructor.apply(this, arguments);
      }

      return Startup;

    })(Model);
    return Startup;
  });

}).call(this);
