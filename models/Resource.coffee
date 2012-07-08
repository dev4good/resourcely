mongoose = require 'mongoose'

Resource = new mongoose.Schema
  name: String
  description: String
  start: Date
  end: Date
  location:
    lon: Number
    lat: Number
  sent: { type: Date, default: Date.now }
  resources:
    type: mongoose.Schema.ObjectId
    ref: 'User'

Resource.index
  location: '2d'

module.exports = mongoose.model 'Resource', Resource
