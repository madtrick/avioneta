define [
  'avioneta/orders',
  'avioneta/components/shot'
], (Orders, Shot) ->
  class Orders.ShootPlayerOrder
    constructor : (@options) ->

    run : (arena) ->
      player = arena.getPlayer(@options.id)
      shot = new Shot x : @options.x, y : @options.y

      player.shots.push shot
