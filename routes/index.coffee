startups = require "./startups"
investors = require "./investors"
talents = require "./talents"

models = require "../models"

# Get home page
index = (req, res) ->
    context =
        title : 'main page'
    res.render 'index', context

# do something with api
api = (req, res) ->
    res.send "API activated"

users = (req, res) ->
    models.UserModel.find (err, items) ->
        if err
            return console.log err
        else
            return res.send items

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

