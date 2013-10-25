define [
  'avioneta/serializers',
  'avioneta/orders/destroy_player_order'
], (Serializers, DestroyPlayerOrder) ->
  class Serializers.DestroyPlayerOrderSerializer
    deserialize : (data) ->
      new DestroyPlayerOrder(data)
