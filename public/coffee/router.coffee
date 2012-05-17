#// Filename: router.js
define ['mediator'],(mediator) ->
    
    class AppRouter extends Backbone.Router
    
        routes:
            '': 'home'
            'startups' : 'startups'
            'talents' : 'talents'
            'investors' : 'investors'
            '*actions': 'defaultAction'
        
        home : ->
            #home stuff here...
            #homeView = new HomeView
            #homeView.render()
            console.log "homepage"

        startups : ->
            console.log "startup page"
            
        talents : ->
            console.log "talents"

        investors : ->
            console.log "investors"
    
        defaultAction: (actions) ->
            #// We have no matching route, lets display the home page
            console.log "Default view"
            #mainHomeView.render()

        initialize : ->
            console.log "Initialize AppRouter"
            @initHistory()

        initHistory : ->
            console.log "Starting browser history"
            Backbone.history.start()
            @navigate()

    AppRouter
