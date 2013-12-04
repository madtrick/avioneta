define [
  'underscore',
  'avioneta/components',
  'avioneta/commands/destroy_player_command',
  'event_bus'
], (_, Components, DestroyPlayerCommand, EventBus) ->
  class Components.Arena
    constructor : (attrs) ->
      @width   = attrs.width
      @height  = attrs.height
      @players = []
      @shots   = []

    addPlayer : (player) ->
      @players.push player
      EventBus.trigger "scoreboard.create", id : player.id, name : player.name, value : player.life(), color : player.color, remote : player.remote

    removePlayer : (player) ->
      @players = _.reject(@players, (e) -> e is player)
      EventBus.trigger "scoreboard.destroy", id : player.id

    addShot : (shot) ->
      @shots.push shot

    removeShot : (shot) ->
      @shots = _.reject(@shots, (e) -> e is shot)

    getPlayer : (playerId) ->
      _.find @players, (player) -> player.id is playerId

    getShot : (shotId) ->
      _.find @shots, (shot) -> shot.id is shotId

    update : (actions, services) ->
      @shots.forEach (s) => actions.push s.update(@, Date.now(), services)
      @players.forEach (p) => actions.push p.update(@, Date.now(), services)

    render : (canvas) ->
      @players.forEach (player) -> player.paint(canvas)
      @shots.forEach (shot) -> shot.paint(canvas)

    isElementOutOfArena : (coordinates, boundings) ->
      # Assume all boundings are circular
      (coordinates.x + boundings.radius() > @width) or
        (coordinates.y + boundings.radius() > @height) or
        (coordinates.x - boundings.radius() < 0) or
        (coordinates.y - boundings.radius() < 0)
