(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['libs/subscriber'], function(Subscriber) {
    'use strict';

    var Model;
    Model = (function(_super) {

      __extends(Model, _super);

      function Model() {
        return Model.__super__.constructor.apply(this, arguments);
      }

      _.defaults(Model.prototype, Subscriber);

      Model.prototype.disposed = false;

      Model.prototype.dispose = function() {
        var prop, properties, _i, _len;
        if (this.disposed) {
          return;
        }
        this.trigger('dispose', this);
        this.unsubscribeAllEvents();
        properties = ['collection', 'attribute', '_escapedAttributes', '_previousAttributes', '_callbacks'];
        for (_i = 0, _len = properties.length; _i < _len; _i++) {
          prop = properties[_i];
          delete this[prop];
        }
        this.disposed = true;
        return typeof Object.freeze === "function" ? Object.freeze(this) : void 0;
      };

      return Model;

    })(Backbone.Model);
    return Model;
  });

}).call(this);
