#// Filename: app.js
define [
    'mediator'
    'router', #// Request router.js
    #'controllers/session'
], (mediator, AppRouter) ->
    
    class Application

        constructor : ->
            #// Pass in our Router module and call it's initialize function
            console.log "Creating new application"
            @initRouter()

        initRouter : ->
            console.log "Defining router"
            mediator.router = new AppRouter()

            # make router property read only
            Object.defineProperty? mediator, 'router', writable: false
        ###
            Controllers can communicate through Pub/Sub methods
        ###
        initControllers : ->
            console.log "Initialize other controllers"
            ## Session controller
            #new SessionController()
    
    Object.freeze? Application

    Application
