# Preload the serializers:
#
# If we want to be able to load, with require "<module_path>", the specific serializers from
# MessageCollectionSerializer this module have to be already loaded.
#
# This is a workaround to preload this moduless
require [
      "avioneta/serializers/notifications/no_seats_left_notification_serializer"
      "avioneta/serializers/move_player_order_serializer"
      "avioneta/serializers/register_player_order_serializer"
      "avioneta/serializers/shoot_player_order_serializer"
      "avioneta/serializers/disconnect_player_order_serializer"
      "avioneta/serializers/destroy_player_order_serializer"
      "avioneta/serializers/rotate_player_order_serializer"
  ]
