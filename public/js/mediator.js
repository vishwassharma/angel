(function() {

  define(function() {
    'use strict';

    var desc, mediator;
    mediator = {};
    mediator.user = null;
    mediator.router = null;
    _.defaults(mediator, Backbone.Events);
    mediator._callback = null;
    mediator.publish = mediator.trigger = Backbone.Events.trigger;
    mediator.subscribe = mediator.on = Backbone.Events.on;
    mediator.unsubscribe = mediator.off = Backbone.Events.off;
    if (Object.defineProperties) {
      desc = {
        writable: false
      };
      Object.defineProperties(mediator, {
        subscribe: desc,
        unsubscribe: desc,
        publish: desc
      });
    }
    if (typeof Object.seal === "function") {
      Object.seal(mediator);
    }
    return mediator;
  });

}).call(this);
