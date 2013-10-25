define [
  'avioneta/orders'
], (Orders, Shot) ->
  class Orders.DestroyPlayerOrder
    constructor : (@options) ->

    run : (arena) ->
      player = arena.getPlayer(@options.id)
      arena.removePlayer(player)
