define [
  'avioneta/serializers/modules',
  'avioneta/orders/register_player_order'
], (Modules, RegisterPlayerOrder) ->
  class Modules.RegisterPlayerOrderSerializer
    deserialize : (data) ->
      new RegisterPlayerOrder(data)
