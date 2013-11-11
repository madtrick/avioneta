define ['avioneta/notifications', 'event_bus'], (Notifications, bus) ->
  class Notifications.NoSeatsLeftNotification
    run : (_arena) ->
      bus.trigger "arena.no_seats_left"
