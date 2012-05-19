startups = require "./startups"
investors = require "./investors"
talents = require "./talents"
users = require "./users"

models = require "../models"

# Get home page
index = (req, res) ->
    search = {}

    if req.session?.auth?.loggedIn
        search =
            author : req.session.auth.userId
    else
        console.log "not logged in"

    context =
        title : 'main page'

    result = models.StartupModel.find search, (err, items) ->
        if (err)
            return "Error"
        else
            context['startups'] = JSON.stringify(items)
            res.render 'index', context

    #console.log startups

    #context =
        #title : 'main page'
        #startups : startups

    #res.render 'index', context

# do something with api
api = (req, res) ->
    res.send "API activated"

# Handle index page
exports.index = index
# Handle api call
exports.api = api
# Handle handle startup related links

# /users
exports.users = users
# /investors
exports.investors = investors
# /talents
exports.talents = talents
# /startups
exports.startups = startups

