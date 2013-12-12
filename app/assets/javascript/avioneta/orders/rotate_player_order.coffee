define ['avioneta/orders/modules'], (Modules) ->
  class Modules.RotatePlayerOrder
    constructor : (@options) ->

    run : (arena) ->
      player = arena.getPlayer(@options.id)
      player.rotate( rotation : @options.rotation)
