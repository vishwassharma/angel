mongoose = require 'mongoose'

libs = require '../libs'
mongooseAuth = libs.mongooseAuth

conf = require '../conf'

mongoose.connect 'mongodb://localhost/angel'

startup = require './startups'
users = require './users'

exports.mongoose  = mongoose
# ---------------------------------------------------------
# Set up user authentication systems
# ---------------------------------------------------------
User = null
users.UserSchema.plugin mongooseAuth,
    everymodule:
        everyauth:
            User: () ->
                return User

    password :
        loginWith : 'email'

        extraParams :
            phone: String
            name :
                first : String
                last: String

        everyauth :
            getLoginPath: '/login'
            postLoginPath: '/login'
            loginView: 'login.jade'
            getRegisterPath: '/register'
            postRegisterPath: '/register'
            registerView: 'register.jade'
            loginSuccessRedirect: '/'
            registerSuccessRedirect: '/'

    twitter:
        everyauth:
            myHostname: 'http://dev.logicstick.com:9000'
            consumerKey: conf.twitter.key
            consumerSecret: conf.twitter.secret
            redirectPath: '/'

    handleLogout : (req, res) ->
        req.logout()
        res.writeHead 303,
            'Location': @logoutRedirectPath()
        res.end()

mongoose.model 'User', users.UserSchema
User = mongoose.model 'User'
# ---------------------------------------------------------
# Export Models
# ---------------------------------------------------------
exports.StartupModel = mongoose.model 'Startup', startup.StartupSchema
exports.UserModel = User
