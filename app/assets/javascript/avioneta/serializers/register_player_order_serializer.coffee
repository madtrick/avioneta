define [
  'avioneta/serializers',
  'avioneta/orders/register_player_order'
], (Serializers, RegisterPlayerOrder) ->
  class Serializers.RegisterPlayerOrderSerializer
    deserialize : (data) ->
      new RegisterPlayerOrder(data)
