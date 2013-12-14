define [
  'avioneta/orders/modules',
  'avioneta/components/player',
  'avioneta/components/models/player/basic_model',
  'avioneta/components/behaviours/player/remote',
  'avioneta/components/behaviours/player/local'
], (Modules, Player, BasicModel, RemotePlayerBehaviour, LocalPlayerBehaviour) ->
  class Modules.RegisterPlayerOrder
    constructor : (@options) ->

    run : (arena) ->
      player = new Player
        id     : @options.id
        color  : @options.color
        model  : new BasicModel(marker : @_marker(), life : @options.life, coordinates : {x : @options.x, y : @options.y}, behaviour : @_behaviour())
        name   : @options.name
        remote : @options.remote

      arena.addPlayer(player)

    _behaviour : ->
      if @options.remote then new RemotePlayerBehaviour() else new LocalPlayerBehaviour()

    _marker : ->
      not @options.remote
