define ['libs/views/view',
    'text!templates/startups/index.html'
], (View, template) ->

    class StartupView extends View
        template : _.template template

        tagName : 'li'

        className : 'ui-state-default'

        id : 'guestItem'
    
        initialize: ->
            # code ....
            console.log "Initialize"
            _.bindAll @ , 'render'
    
    
        render: ->
            #.... your code here.....
            #@$el.html @template model :@model
            @$el.html @template
            console.log @$el
            @

    StartupView
