define [
  'avioneta/orders',
  'avioneta/components/shot',
  'avioneta/components/models/shot/basic_model'
], (Orders, Shot, BasicModel) ->
  class Orders.ShootPlayerOrder
    constructor : (@options) ->

    run : (arena) ->
      player = arena.getPlayer(@options.id)
      shot = new Shot(
        id     : @options.shot_id
        player : player
        remote : undefined
        model : new BasicModel(coordinates : player.coordinates(), rotation : player.rotation())
      )

      arena.addShot shot
