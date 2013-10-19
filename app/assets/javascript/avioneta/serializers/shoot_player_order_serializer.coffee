define [
  'avioneta/serializers',
  'avioneta/orders/shoot_player_order'], (Serializers, ShootPlayerOrder) ->
  class Serializers.ShootPlayerOrderSerializer
    deserialize : (data) ->
      new ShootPlayerOrder(data)
