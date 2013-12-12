define [
  'avioneta/serializers/modules',
  'avioneta/orders/destroy_player_order'
], (Modules, DestroyPlayerOrder) ->
  class Modules.DestroyPlayerOrderSerializer
    deserialize : (data) ->
      new DestroyPlayerOrder(data)
