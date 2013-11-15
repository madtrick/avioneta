define [
  'avioneta/orders',
  'avioneta/components/shot',
  'avioneta/components/models/shot/basic_model'
], (Orders, Shot, BasicModel) ->
  class Orders.ShotHitPlayerOrder
    constructor : (@options) ->

    run : (arena) ->
      arena.getShot(@options.shot_id).hit()
      arena.getPlayer(@options.player_id).hit()

