mongoose = require 'mongoose'

Schema = mongoose.Schema

Links = new Schema
            website: String
            blog: String
            facebook : String
            about_me : String
            linkedin : String
            twitter : String
            github : String


About = new Schema
            location : [String]
            roles : [String]
            colleges : [String]

UserSchema = new Schema
                name : String
                email : String
                username : String
                photo : String
                mini_resume : String

exports.UserSchema = UserSchema
