define [
  'config/modules',
  'config/base'
  ], (Modules, Base) ->
  class Modules.Development extends Base
    @override("avioneta.websockets.url", "ws://localhost:8080")
