manifest = require './package.json'
mongoose = require 'mongoose'
mongoose.connect "mongodb://localhost/#{manifest.name}-dev"
Resource = require './models/Resource'
User     = require './models/User'

user = new User
        name:
          first: 'John'
          last: 'Doe'
        email:"john@doe.com"
user.save (err) ->
  console.log err if err?

usr2 = new User
        name:
          first: 'Acme'
          last: 'Company'
        email:"boss@acme.com"
usr2.save (err) ->
    console.log err if err?

console.log "Added ", user, usr2

res = new Resource
        type: "offer"
        name: "Sample Offer"
        description: "This is a sample offer (in the future)"
        start: new Date() + 300
        end: new Date() + 36000
        location:
          lon: 0
          lat: 0
        tags: [ "offer", "shovel" ]
        createdAt: new Date()
        taker: null
res.save (err) ->
  console.log err if err?

res2 = new Resource
        type: "request"
        name: "Sample request"
        description: "This is a sample request"
        start: new Date() - 300
        end: new Date() + 36000
        location:
          lon: 0
          lat: 0
        tags: [ "request", "food" ]
        sent: new Date()
        taker: user
res2.save (err) ->
  console.log err if err?

console.log "Added ", res, res2
