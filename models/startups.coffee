mongoose = require('mongoose')

mongoose.connect 'mongodb://localhost/angel'

Schema = mongoose.Schema

Startup = new Schema
            title : String
            description : String

exports.StartupModel = mongoose.model 'Startup', Startup
