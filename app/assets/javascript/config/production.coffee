define [
  'config/modules',
  'config/base'
  ], (Modules, Base) ->
  class Modules.Production extends Base
    @override("avioneta.websockets.url", "ws://blooming-tundra-4573.herokuapp.com")
