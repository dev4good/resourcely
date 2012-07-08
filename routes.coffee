mongoose = require 'mongoose'
Resource = require './models/Resource'
User     = require './models/User'

@include = ->
  @get '/': -> @render 'landing'

  #
  # JSON for landing page stream (offers)
  #
  @get '/offers': ->
    Resource.find ['type': 'offer', 'taker': '$eq': null, 'start': '$gte': new Date(), 'end': '$gte': new Date()],  (err, offers) =>
      @response.json offers

  #
  # JSON for landing page stream (requests)
  #
  @get '/requests': ->
    Resource.find ['type': 'requests', 'taker': '$eq': null, 'start': '$lte': new Date(), 'end': '$gte': new Date()],  (err, requests) =>
      @response.json requests

  #
  # Mark a resource consumed (tickbox)
  #
  @get /\/consume\/(\w+)/, ->
    if @session?.user?
      Resource.update '_id': @params[0], [ 'taker': @session.user ], {}, (err, updated) =>
        console.log "Error while updating resource" if err?
        @response.json updated unless err?
    else
      console.log "You are not logged in"
      @response.redirect 'home'

  #
  # Adding offers
  #
  @post '/offers': ->
    offer = new Resource @body.post
    offer.owner = @session.user
    offer.save (err) ->
      console.log "Error while saving offer" if err?
      @response.json offer unless err?

  #
  # Adding requests
  #
  @post '/requests': ->
    request = new Resource @body.post
    request.owner = @session.user
    request.save (err) ->
      console.log "Error while saving request" if err?
      @response.json request unless err?
