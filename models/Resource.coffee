mongoose = require 'mongoose'

ResourceSchema = new mongoose.Schema
  name: String
  description: String
  start: Date
  end: Date
  location:
    lon: Number
    lat: Number
  tags: [ String ]
  createdAt: { type: Date, default: Date.now }
  taker:
    type: mongoose.Schema.ObjectId
    ref: 'User'

ResourceSchema.index
  location: '2d'

module.exports = mongoose.model 'Resource', ResourceSchema
