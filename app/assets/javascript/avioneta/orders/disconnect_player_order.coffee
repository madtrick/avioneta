define [
  'avioneta/orders/modules',
  'avioneta/components/player'
], (Modules, Player) ->
  class Modules.DisconnectPlayerOrder
    constructor : (@options) ->

    run : (arena) ->
      arena.removePlayer(arena.getPlayer(@options.id))
