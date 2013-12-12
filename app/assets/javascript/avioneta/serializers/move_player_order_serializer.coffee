define [
  'avioneta/serializers/modules',
  'avioneta/orders/move_player_order'
], (Modules, MovePlayerOrder) ->
  class Modules.MovePlayerOrderSerializer
    deserialize : (data) ->
      new MovePlayerOrder(data)
