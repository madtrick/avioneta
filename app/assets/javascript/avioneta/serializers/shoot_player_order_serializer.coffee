define [
  'avioneta/serializers/modules',
  'avioneta/orders/shoot_player_order'], (Modules, ShootPlayerOrder) ->
  class Modules.ShootPlayerOrderSerializer
    deserialize : (data) ->
      new ShootPlayerOrder(data)
