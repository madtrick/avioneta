define [
  'avioneta/orders',
  'avioneta/components/shot',
  'avioneta/components/models/shot/basic_model'
], (Orders, Shot, BasicModel) ->
  class Orders.ShootPlayerOrder
    constructor : (@options) ->

    run : (arena) ->
      shot = new Shot(
        id     : @options.shot_id
        player : arena.getPlayer(@options.id)
        remote : undefined
        model : new BasicModel(x : @options.x, y : @options.y))

      arena.addShot shot
      #player.shots.push shot
