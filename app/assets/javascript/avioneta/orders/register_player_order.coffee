define [
  'avioneta/orders',
  'avioneta/components/player'
], (Orders, Player) ->
  class Orders.RegisterPlayerOrder
    constructor : (@options) ->

    run : (arena) ->
      player = new Player
        id     : @options.id
        x      : @options.x
        y      : @options.y
        remote : true

      arena.addPlayer(player)
