define [
  'underscore',
  'avioneta/components',
  'avioneta/commands/destroy_player_command',
  'event_bus'
], (_, Components, DestroyPlayerCommand, EventBus) ->
  class Components.Arena
    constructor : (attrs) ->
      @width  = attrs.width
      @height = attrs.height
      @players= []
      @shots = []

    addPlayer : (player) ->
      @players.push player
      EventBus.trigger "scoreboard.create", id : player.id, name : player.name, value : 100, color : player.color, remote : player.remote

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

    update : (commands) ->
      #@players.forEach (p1) => 
      #  if p1.isDestroyed()
      #    @removePlayer p1
      #  else if p1.isAlive()
      #    @_consolidatePlayer p1

          #p1.shots.forEach @_updateShot

          #@players.forEach (p2) =>
          #  if (p2 isnt p1) and (not p1.remote) and p1.collidesWith p2.boundingBox()
          #    p1.backtrack()
          #  p1.shots.forEach (s) =>
          #    #@players.forEach (p2) =>
          #    if s.active and (p2 isnt p1) and p2.collidesWith(s.boundingBox())
          #      s.active = false

          #      #unless s.remote
          #      p2.hit()
          #      unless s.remote
          #        unless p2.isAlive()
          #          console.log "Destroyed"
          #          commands.push(new DestroyPlayerCommand(player : p2.id))

      @shots.forEach (s) => commands.push s.update(@, Date.now())
      @players.forEach (p) => commands.push p.update(@, Date.now())

    render : (canvas) ->
      @players.forEach (player) =>
        player.paint(canvas)
        #player.shots.forEach (shot) =>
        #  shot.paint(canvas)

      @shots.forEach (shot) -> 
        console.log "Painting shot"
        shot.paint(canvas)

    _consolidatePlayer : (player) =>
       player.backtrack() if @_playerOutOfArena(player)

    #_updateShot : (shot) =>
    #  shot.move()
    #  shot.active = false if @_shotOutOfArena(shot)

    #_shotOutOfArena : (shot) ->
    #  shot.boundingBox().upperLeft.y > @height

    _playerOutOfArena : (player) ->
      boundingBox = player.boundingBox()
      boundingBox.upperLeft.x < 0 or
        boundingBox.upperLeft.y < 0 or
        boundingBox.lowerLeft.y > @height or
        boundingBox.lowerRight.x > @width
