define [
  'avioneta/serializers',
  'avioneta/orders/shot_hit_player_order'], (Serializers, ShotHitPlayerOrder) ->
  class Serializers.ShotHitPlayerOrderSerializer
    deserialize : (data) ->
      new ShotHitPlayerOrder(data)

