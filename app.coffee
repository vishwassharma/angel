express = require "express"
router = require "./routes"

app = module.exports = express.createServer()

port = 9000
app_root = __dirname

# Set up some basic configuration
app.configure ()->
    app.set 'views', app_root+'/templates'
    app.set 'view engine', 'jade'
    app.set 'view options',
        layout : false
    app.use express.methodOverride()
    app.use express.bodyParser()
    app.use app.router
    #return

# Can also configure for development and production

app.configure 'development', ()->
    app.use express.static app_root+'/public'
    app.use express.errorHandler
        dumpExceptions: true
        showStack: true

app.configure 'production', () ->
    oneYear = 31557600000
    app.use express.static app_root+'/public',
        maxAge : oneYear
    app.use express.errorHandler()

app.get '/', router.index


app.listen port, (event) ->
    console.log "[*] Server listening on #{port}"
