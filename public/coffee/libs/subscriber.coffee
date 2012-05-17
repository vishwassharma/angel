define ['mediator'], (mediator) ->
    'use strict'

    class Subscriber

        # manage all the subscribers
        globalSubscriptions : null

        subscribeEvent: (type, handler) ->
            @globalSubscriptions or= {}
            # Get the handlers
            handlers = @globalSubscriptions[type] or= []
            # once we have all the handlers find the handler
            return if _.include handlers, handler
            # if handler is not found in handlers then push
            handlers.push handler
            # Register with global handlers
            mediator.subscribe type, handler, this

        unsubscribeEvent : (type, handler) ->
            # Check for globalSubscriptions if not there then return
            return unless @globalSubscriptions

            handlers = @globalSubscriptions[type]
            # if handler exists then remove it
            if handler
                # find the index of handler amoung all the handler
                # for a perticular event
                index = _.indexOf handlers, handler
                handlers.splice index, 1 if index > -1
                delete @globalSubscriptions[type] if handlers.length is 0
            
            # Remove from the mediator
            mediator.unsubscribe type, handler

        unsubscribeAllEvents: ->
            # check for globalSub if not there
            # then return
            return unless @globalSubscriptions

            for own type, handlers of @globalSubscriptions
                for handler in handlers
                    # remove global handlers
                    mediator.unsubscribe type, handler

            delete @globalSubscriptions

    Subscriber
