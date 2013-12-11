define ['avioneta/orders'], (Orders) ->
  class Orders.MovePlayerOrder
    constructor : (@options) ->

    run : (arena) ->
      player = arena.getPlayer(@options.id)
      player.move direction : @options.direction
