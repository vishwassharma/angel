define ['libs/models/collection', 'startups/model'], (Collection, Startup) ->

    class StartupList extends Collection

        url : '/api/startups/'

        model : Startup
    
    startupList = new StartupList

    startupList
