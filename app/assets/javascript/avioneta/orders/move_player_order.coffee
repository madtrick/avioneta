define ['avioneta/orders/modules'], (Modules) ->
  class Modules.MovePlayerOrder
    constructor : (@options) ->

    run : (arena) ->
      player = arena.getPlayer(@options.id)
      player.move direction : @options.direction
