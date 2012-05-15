mongoose = require 'mongoose'

Schema = mongoose.Schema

StartupSchema = new Schema
            title : String
            description : String

exports.StartupSchema = StartupSchema
