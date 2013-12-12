define [
  'avioneta/serializers/modules',
  'avioneta/orders/disconnect_player_order'
], (Modules, DisconnectPlayerOrder) ->
  class Modules.DisconnectPlayerOrderSerializer
    deserialize : (data) ->
      new DisconnectPlayerOrder(data)
