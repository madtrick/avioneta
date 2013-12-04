define [
  'avioneta/orders',
  'avioneta/components/player',
  'avioneta/components/models/player/basic_model',
  'avioneta/components/behaviours/player/remote',
  'avioneta/components/behaviours/player/local'
], (Orders, Player, BasicModel, RemotePlayerBehaviour, LocalPlayerBehaviour) ->
  class Orders.RegisterPlayerOrder
    constructor : (@options) ->

    run : (arena) ->
      player = new Player
        id     : @options.id
        color  : @options.color
        model  : new BasicModel(life : @options.life, coordinates : {x : @options.x, y : @options.y}, behaviour : @_behaviour())
        name   : @options.name
        remote : @options.remote

      arena.addPlayer(player)

    _behaviour : ->
      if @options.remote then new RemotePlayerBehaviour() else new LocalPlayerBehaviour()
