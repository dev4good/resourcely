@include = ->
  @get '/': -> @render 'landing'

  #
  # JSON for landing page stream (requests)
  #
  @get '/offers': ->
    Resource.find ['type': 'offer', 'taker': '$eq': null, 'since': '$gte': Time.now, 'until': '$gte': Time.now],  (err, offers) =>
      @response.json offers

  #
  # JSON for landing page stream (requests)
  #
  @get '/requests': ->
    Resource.find ['type': 'requests', 'taker': '$eq': null, 'since': '$lte': Time.now, 'until': '$gte': Time.now],  (err, offers) =>
    @response.json requests

  #
  # Mark a resource consumed (tickbox)
  #
  @get '/consume/:id': ->
    Resource.update '_id': id, [ 'taker': @session.user ], {}, (err, updated) =>
      console.log "Error while updating resource" if err?
      @response.json updated unless err?

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
