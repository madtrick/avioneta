define [
  'avioneta/orders',
  'event_bus'
], (Orders, EventBus) ->
  class Orders.DestroyPlayerOrder
    constructor : (@options) ->

    run : (arena) ->
      player = arena.getPlayer(@options.id)
      arena.removePlayer(player)

      EventBus.trigger "player.destroyed"
