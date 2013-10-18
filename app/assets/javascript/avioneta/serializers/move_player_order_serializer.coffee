define [
  'avioneta/serializers',
  'avioneta/orders/move_player_order'
], (Serializers, MovePlayerOrder) ->
  class Serializers.MovePlayerOrderSerializer
    deserialize : (data) ->
      new MovePlayerOrder(data)
