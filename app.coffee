require('zappa') ->
  manifest = require './package.json'
  mongoose = require 'mongoose'
  mongooseAuth = require 'mongoose-auth'

  User = require './models/User'
  Resource = require './models/Resource'

  @configure =>
    #@set 'view engine': 'jade'
    @use 'bodyParser',
      'methodOverride',
      @app.router,
      'static',
      mongooseAuth.middleware()

  @configure
    development: =>
      mongoose.connect "mongodb://localhost/#{manifest.name}-dev"
      @use errorHandler: {dumpExceptions: on, showStack: on}
    production: =>
      mongoose.connect "mongodb://localhost/#{manifest.name}"
      @use 'errorHandler'

  @include 'routes'
