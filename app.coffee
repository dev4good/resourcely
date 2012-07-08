require('zappa') ->
  manifest = require './package.json'
  mongoose = require 'mongoose'
  passport = require 'passport'
  googOID = require('passport-google').Strategy

  User = require './models/User'
  Resource = require './models/Resource'

  passport.use new googOID
    returnURL: 'http://localhost:3000/auth/google/return'
    , realm: 'http://localhost:3000'
    , (identifier, profile, done) ->
      User.findOrCreate { openId: identifier }, (err, user) ->
        done err, { user: user, profile: profile }

  passport.serializeUser (auth, done) ->
    done null, auth

  passport.deserializeUser (auth, done) ->
    User.findById auth.user._id, (err, user) ->
      done err, auth

  @configure =>
    #@set 'view engine': 'jade'
    @use 'cookieParser',
      'bodyParser',
      'methodOverride',
      'session': secret: 'shhhhhhhhhhhhhh!',
      passport.initialize(),
      passport.session(),
      @app.router,
      static: __dirname + '/static',

  @configure
    development: =>
      mongoose.connect "mongodb://localhost/#{manifest.name}-dev"
      @use errorHandler: {dumpExceptions: on, showStack: on}
    production: =>
      mongoose.connect "mongodb://localhost/#{manifest.name}"
      @use 'errorHandler'

  @include 'routes'
