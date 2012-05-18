startups = require "./startups"
investors = require "./investors"
talents = require "./talents"
users = require "./users"

models = require "../models"

# Get home page
index = (req, res) ->
    context =
        title : 'main page'

    models.StartupModel.find (err, items) ->
        if (err)
            return "Error"
        else
            context['startups'] = JSON.stringify(items)
            return res.render 'index', context

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

