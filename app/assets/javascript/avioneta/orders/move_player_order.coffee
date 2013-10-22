define ['avioneta/orders'], (Orders) ->
  class Orders.MovePlayerOrder
    constructor : (@options) ->

    run : (arena) ->
      player = arena.getPlayer(@options.id)
      player.move axis : "x", value : @options.x
      player.move axis : "y", value : @options.y
