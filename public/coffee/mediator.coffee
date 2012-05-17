define ->
    'use strict'

    mediator = {}
    
    mediator.user = null
    mediator.router = null

    _.defaults mediator, Backbone.Events
    # Create a empty call backlist
    mediator._callback = null

    mediator.publish = mediator.trigger = Backbone.Events.trigger
    mediator.subscribe = mediator.on = Backbone.Events.on
    mediator.unsubscribe = mediator.off = Backbone.Events.off

    # make subscribe / unsubscribe property readonly
    if Object.defineProperties
        desc = writable : false
        Object.defineProperties mediator, 
            subscribe: desc, unsubscribe : desc, publish: desc

    # Once we have made the mediator object seald it
    Object.seal? mediator

    mediator

