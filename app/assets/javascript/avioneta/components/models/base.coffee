define [
  'avioneta/components/models/modules'
  ], (Modules) ->
  class Modules.Base
    constructor : (options) ->
      @painter     = options.painter
      @boundings   = options.boundings
      @coordinates = {x : options.coordinates.x, y : options.coordinates.y}
      @behaviour   = options.behaviour
      @rotation    = options.rotation

    move : (args) ->
      throw "Missing implementation"

    paint : (canvas) ->
      @painter.paint(@, canvas)

    update : (element, arena, time, services) ->
      @behaviour.update(element, arena, time, services)

    rotate : (args) ->
      @rotation =  args.rotation
