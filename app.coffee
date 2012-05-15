express = require "express"
everyauth = require "everyauth"
path = require "path"
router = require "./routes"
utils = require "./libs/utils"
config = require "./conf"

app = module.exports = express.createServer()

port = 9000
app_root = __dirname

# Add the tuts
everyauth.twitter
    .consumerKey conf.twitter.key
    .consumerSecret conf.twitter.secret
    .findOrCreateUser((session, token, secret, user) ->
        console.log user
        return user
        #promise = @.Promise().fulfill user
    ).redirectPath '/'

# Set up some basic configuration
app.configure ()->
    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use express.cookieParser()
    app.use express.session secret : 'saldkfjl04933j34oj0943kljsd'
    app.use everyauth.middleware()
    app.use app.router
    app.set 'views', path.join(app_root,'templates')
    app.set 'view engine', 'jade'
    app.set 'view options',
        layout : false
    #return

# Can also configure for development and production

app.configure 'development', ()->
    app.use express.static path.join(app_root,'public')
    app.use express.errorHandler
        dumpExceptions: true
        showStack: true

app.configure 'production', () ->
    oneYear = 31557600000
    app.use express.static path.join(app_root, 'public')
        maxAge : oneYear
    app.use express.errorHandler()

app.get '/', router.index
app.get '/api', router.api

# Startup related links
app.get '/api/startups', router.startups.get
app.get '/api/startups/:id', router.startups.get
app.post '/api/startups', router.startups.post
app.put '/api/startups/:id', router.startups.put
app.delete '/api/startups/:id', router.startups.del


everyauth.helpExpress app

app.listen port, (event) ->
    console.log "[*] Server listening on #{port}"
