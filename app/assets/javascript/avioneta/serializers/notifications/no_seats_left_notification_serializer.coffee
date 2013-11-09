define [
  'avioneta/serializers/notifications',
  'avioneta/notifications/no_seats_left_notification'
], (Notifications, NoSeatsLeftNotification) ->
  class Notifications.NoSeatsLeftNotificationSerializer
    deserialize : (_data) ->
      new NoSeatsLeftNotification()
