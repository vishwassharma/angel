(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['libs/models/model'], function(Model) {
    var Talent;
    Talent = (function(_super) {

      __extends(Talent, _super);

      function Talent() {
        return Talent.__super__.constructor.apply(this, arguments);
      }

      return Talent;

    })(Model);
    return Talent;
  });

}).call(this);
