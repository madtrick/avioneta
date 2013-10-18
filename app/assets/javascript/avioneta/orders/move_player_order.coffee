define ['avioneta/orders'], (Orders) ->
  class Orders.MovePlayerOrder
    constructor : (@options) ->

    run : (arena) ->
      player = arena.getPlayer(@options.id)
      player.x = @options.x
      player.y = @options.y
