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

    twitter:
        everyauth:
            myHostname: 'http://dev.logicstick.com:9000'
            consumerKey: conf.twitter.key
            consumerSecret: conf.twitter.secret
            redirectPath: '/'

mongoose.model 'User', users.UserSchema
User = mongoose.model 'User'
# ---------------------------------------------------------
# Export Models
# ---------------------------------------------------------
exports.StartupModel = mongoose.model 'Startup', startup.StartupSchema
exports.UserModel = User
