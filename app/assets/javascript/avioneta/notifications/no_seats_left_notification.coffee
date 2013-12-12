define ['avioneta/notifications/modules', 'event_bus'], (Modules, bus) ->
  class Modules.NoSeatsLeftNotification
    run : (_arena) ->
      bus.trigger "arena.no_seats_left"
