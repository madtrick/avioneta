define [
  'avioneta/orders',
  'event_bus'
], (Orders, EventBus) ->
  class Orders.DestroyPlayerOrder
    constructor : (@options) ->

    run : (arena) ->
      arena.getPlayer(@options.id).destroy()
      #player = arena.getPlayer(@options.id)
      #arena.removePlayer(player)

      #EventBus.trigger "player.destroyed"
