define [
  'avioneta/orders',
  'avioneta/components/player',
  'avioneta/components/models/player/basic_model',
  'avioneta/components/behaviours/remote_player_behaviour',
  'avioneta/components/behaviours/local_player_behaviour'
], (Orders, Player, BasicModel, RemotePlayerBehaviour, LocalPlayerBehaviour) ->
  class Orders.RegisterPlayerOrder
    constructor : (@options) ->

    run : (arena) ->
      player = new Player
        id     : @options.id
        color  : @options.color
        model  : new BasicModel(x : @options.x, y : @options.y)
        name   : @options.name
        remote : @options.remote
        behaviour : if @options.remote then new RemotePlayerBehaviour() else new LocalPlayerBehaviour()

      arena.addPlayer(player)
