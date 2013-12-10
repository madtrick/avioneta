define [
  'initializers/services',
  'initializers/views',
  'initializers/interests',
  'avioneta/init'
  ], (Services, Views, Interests, Avioneta) ->
    init : ->
      Avioneta.init(services : Services)
