define [
  'avioneta/serializers',
  'avioneta/orders/rotate_player_order'
], (Serializers, RotatePlayerOrder) ->
  class Serializers.MovePlayerOrderSerializer
    deserialize : (data) ->
      new RotatePlayerOrder(data)
