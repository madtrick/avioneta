define [
  'avioneta/orders',
  'avioneta/components/player'
], (Orders, Player) ->
  class Orders.DisconnectPlayerOrder
    constructor : (@options) ->

    run : (arena) ->
      arena.removePlayer(arena.getPlayer(@options.id))
