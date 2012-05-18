mongoose = require 'mongoose'

Schema = mongoose.Schema

StartupSchema = new Schema
                author : Schema.ObjectId
                name : String
                high_concept_pitch : String



exports.StartupSchema = StartupSchema
