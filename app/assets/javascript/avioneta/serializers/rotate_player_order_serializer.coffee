define [
  'avioneta/serializers/modules',
  'avioneta/orders/rotate_player_order'
], (Modules, RotatePlayerOrder) ->
  class Modules.MovePlayerOrderSerializer
    deserialize : (data) ->
      new RotatePlayerOrder(data)
