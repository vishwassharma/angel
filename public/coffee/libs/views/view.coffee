define ['mediator'], (mediator) ->

    class View extends Backbone.View
    
        initialize: ->
            # code ....
            _.bindAll @ , 'render'
    
        render: ->
            #.... your code here.....
            @

        disposed : false

        dispose : =>
            # if already disposed
            return if @disposed

            # Unbind all model events
            # unbind all subscribe events
            # remove element from the container
            @$el.remove()

            # remove element references
            properties = ['el', '$el', 'model', 'options', 'collection']

            delete @[prop] for prop in properties

            # say disposed
            @disposed = true

            Object.freeze? this

    View
