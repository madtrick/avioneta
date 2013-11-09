define ['avioneta/notifications'], (Notifications) ->
  class Notifications.NoSeatsLeftNotification
    run : (arena) ->
      console.log "No seats left notification"
