(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['libs/models/model'], function(Model) {
    var Investor;
    Investor = (function(_super) {

      __extends(Investor, _super);

      function Investor() {
        return Investor.__super__.constructor.apply(this, arguments);
      }

      return Investor;

    })(Model);
    return Investor;
  });

}).call(this);
