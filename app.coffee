require('zappa') ->
  @configure =>
    #@set 'view engine': 'jade'
    @use 'bodyParser', 'methodOverride', @app.router, 'static'

  @configure
    development: => @use errorHandler: {dumpExceptions: on, showStack: on}
    production: => @use 'errorHandler'

  @include 'routes'
