define [
  'avioneta/serializers',
  'avioneta/orders/disconnect_player_order'
], (Serializers, DisconnectPlayerOrder) ->
  class Serializers.DisconnectPlayerOrderSerializer
    deserialize : (data) ->
      new DisconnectPlayerOrder(data)
