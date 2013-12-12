define [
  'avioneta/serializers/notifications/modules',
  'avioneta/notifications/no_seats_left_notification'
], (Modules, NoSeatsLeftNotification) ->
  class Modules.NoSeatsLeftNotificationSerializer
    deserialize : (_data) ->
      new NoSeatsLeftNotification()
