define [
  'underscore',
  'avioneta/initializers/services',
  'avioneta/initializers/serializers',
  'avioneta/setup'
  ], (_, Services, Serializers, Setup) ->

  init : (options) ->
    Setup.init(services : _.extend Services, options.services )
