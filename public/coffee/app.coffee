class BasicView extends Backbone.View

    el : '#container'

    template : "<span>Template</span>"

    initialize: ->
        # code ....
        _.bindAll @ , 'render'

    render: ->
        #.... your code here.....
        @$el.html @template
        @

class BasicRouter extends Backbone.Router

    routes:
        '/': 'home'
        '/startups' : 'startups'
    
    home: ->
        #function stuff here...
        console.log 'home page'

    startup : ->
        console.log 'startup page'


application = new BasicRouter
Backbone.history.start()
