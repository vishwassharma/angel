(function() {
  var __hasProp = {}.hasOwnProperty;

  define(['mediator'], function(mediator) {
    'use strict';

    var Subscriber;
    Subscriber = (function() {

      function Subscriber() {}

      Subscriber.prototype.globalSubscriptions = null;

      Subscriber.prototype.subscribeEvent = function(type, handler) {
        var handlers, _base;
        this.globalSubscriptions || (this.globalSubscriptions = {});
        handlers = (_base = this.globalSubscriptions)[type] || (_base[type] = []);
        if (_.include(handlers, handler)) {
          return;
        }
        handlers.push(handler);
        return mediator.subscribe(type, handler, this);
      };

      Subscriber.prototype.unsubscribeEvent = function(type, handler) {
        var handlers, index;
        if (!this.globalSubscriptions) {
          return;
        }
        handlers = this.globalSubscriptions[type];
        if (handler) {
          index = _.indexOf(handlers, handler);
          if (index > -1) {
            handlers.splice(index, 1);
          }
          if (handlers.length === 0) {
            delete this.globalSubscriptions[type];
          }
        }
        return mediator.unsubscribe(type, handler);
      };

      Subscriber.prototype.unsubscribeAllEvents = function() {
        var handler, handlers, type, _i, _len, _ref;
        if (!this.globalSubscriptions) {
          return;
        }
        _ref = this.globalSubscriptions;
        for (type in _ref) {
          if (!__hasProp.call(_ref, type)) continue;
          handlers = _ref[type];
          for (_i = 0, _len = handlers.length; _i < _len; _i++) {
            handler = handlers[_i];
            mediator.unsubscribe(type, handler);
          }
        }
        return delete this.globalSubscriptions;
      };

      return Subscriber;

    })();
    return Subscriber;
  });

}).call(this);
