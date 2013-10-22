define [
  'avioneta/orders',
  'avioneta/components/player',
  'avioneta/components/models/player/basic_model'
], (Orders, Player, BasicModel) ->
  class Orders.RegisterPlayerOrder
    constructor : (@options) ->

    run : (arena) ->
      player = new Player
        id     : @options.id
        model  : new BasicModel(x : @options.x, y : @options.y)
        remote : true

      arena.addPlayer(player)
