define [
  'avioneta/components/models/player'
], (Player) ->
  class Player.BaseModel
    constructor : (options) ->
      @painter     = new @painter()
      @boundings   = options.boundings
      @coordinates = {x : options.x, y : options.y}
      @life        = options.life or 100
      @destroyed   = options.destroyed or false
      @behaviour   = options.behaviour
      @rotation    = options.rotation

    paint : (canvas) ->
      @painter.paint(canvas, @)

    isAlive : ->
      @life > 0

    update : (player, arena, time, services) ->
      @behaviour.update(player, arena, time, services)

    rotate : ->
      throw "Missing implementation"
