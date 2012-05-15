startups = require('./startups')

# Get home page
index = (req, res) ->
    context =
        title : 'main page'
    res.render 'index', context

# do something with api
api = (req, res) ->
    res.send "API activated"

# Handle index page
exports.index = index
# Handle api call
exports.api = api

# Handle handle startup related links
exports.startups = startups
