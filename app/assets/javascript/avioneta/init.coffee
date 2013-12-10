define [
  'underscore',
  'avioneta/initializers/services',
  'avioneta/setup'
  ], (_, Services, Setup) ->

  init : (options) ->
    Setup.init(services : _.extend Services, options.services )
