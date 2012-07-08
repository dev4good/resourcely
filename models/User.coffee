mongoose = require 'mongoose'
supergoose = require 'supergoose'

UserSchema = new mongoose.Schema
  openId: String
  resources: [{ type: mongoose.Schema.ObjectId, ref: 'Resource' }]

UserSchema.plugin supergoose

User = mongoose.model 'User', UserSchema
module.exports = User
