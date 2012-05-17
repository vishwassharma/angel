(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['mediator'], function(mediator) {
    var View;
    View = (function(_super) {

      __extends(View, _super);

      function View() {
        this.dispose = __bind(this.dispose, this);
        return View.__super__.constructor.apply(this, arguments);
      }

      View.prototype.initialize = function() {
        return _.bindAll(this, 'render');
      };

      View.prototype.render = function() {
        return this;
      };

      View.prototype.disposed = false;

      View.prototype.dispose = function() {
        var prop, properties, _i, _len;
        if (this.disposed) {
          return;
        }
        this.$el.remove();
        properties = ['el', '$el', 'model', 'options', 'collection'];
        for (_i = 0, _len = properties.length; _i < _len; _i++) {
          prop = properties[_i];
          delete this[prop];
        }
        this.disposed = true;
        return typeof Object.freeze === "function" ? Object.freeze(this) : void 0;
      };

      return View;

    })(Backbone.View);
    return View;
  });

}).call(this);
