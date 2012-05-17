define ['libs/subscriber'], (Subscriber) ->
    'use strict'

    class Model extends Backbone.Model
        
        # Mixin with the subscriber model
        _.defaults Model.prototype, Subscriber

        # Disposal
        # --------
        
        disposed : false

        dispose : ->
            # return if already disposed
            return if @disposed

            # Fire a event to notify events and view
            @trigger 'dispose', this

            # unbind all global events
            @unsubscribeAllEvents()

            # Remove the collection references,
            # attribute and event handlers
            properties = ['collection', 'attribute','_escapedAttributes',
                '_previousAttributes', '_callbacks']

            delete @[prop] for prop in properties

            # Finished doing disposing
            @disposed = true

            # You have frozen something now
            Object.freeze? this
    
    Model

