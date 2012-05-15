express = require "express"
everyauth = require "everyauth"
path = require "path"
router = require "./routes"
utils = require "./libs"
conf = require "./conf"

csrf = require 'express-csrf'
# -----------------------------------
# DB stuff
# -----------------------------------
Promise = everyauth.Promise
mongooseAuth = utils.mongooseAuth
# -----------------------------------


app = module.exports = express.createServer()

port = 9000
app_root = __dirname

app.dynamicHelpers
    csrf: csrf.token

MemStore = require  'express/node_modules/connect/lib/middleware/session/memory'

# Set up some basic configuration
app.configure ()->
    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use express.cookieParser()

    app.use express.session
        secret : 'saldkfjl04933j34oj0943kljsd'
        store : new MemStore
            reapInterval : 50000 * 10

    app.use csrf.check()
    #app.use everyauth.middleware()
    #app.use app.router
    app.use mongooseAuth.middleware()
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
app.get '/users', router.users
app.get '/api', router.api

# Startup related links
app.get '/api/startups', router.startups.get
app.get '/api/startups/:id', router.startups.get
app.post '/api/startups', router.startups.post
app.put '/api/startups/:id', router.startups.put
app.delete '/api/startups/:id', router.startups.del


mongooseAuth.helpExpress app

app.listen port, (event) ->
    console.log "[*] Server listening on #{port}"
