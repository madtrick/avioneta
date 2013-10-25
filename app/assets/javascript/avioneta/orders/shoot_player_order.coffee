define [
  'avioneta/orders',
  'avioneta/components/shot',
  'avioneta/components/models/shot/basic_model'
], (Orders, Shot, BasicModel) ->
  class Orders.ShootPlayerOrder
    constructor : (@options) ->

    run : (arena) ->
      player = arena.getPlayer(@options.id)
      shot = new Shot(remote : true, model : new BasicModel(x : @options.x, y : @options.y))

      player.shots.push shot
