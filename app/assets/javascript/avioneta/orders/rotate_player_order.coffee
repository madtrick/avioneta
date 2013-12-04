define ['avioneta/orders'], (Orders) ->
  class Orders.RotatePlayerOrder
    constructor : (@options) ->

    run : (arena) ->
      player = arena.getPlayer(@options.id)
      player.rotate( rotation : @options.rotation)
