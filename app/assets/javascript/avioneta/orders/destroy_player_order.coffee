define [
  'avioneta/orders/modules',
  'event_bus'
], (Modules, EventBus) ->
  class Modules.DestroyPlayerOrder
    constructor : (@options) ->

    run : (arena) ->
      arena.getPlayer(@options.id).destroy()
