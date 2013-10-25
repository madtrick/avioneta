define [
  'underscore',
  'avioneta/components',
  'avioneta/commands/destroy_player_command'
], (_, Components, DestroyPlayerCommand) ->
  class Components.Arena
    constructor : (attrs) ->
      @width  = attrs.width
      @height = attrs.height
      @players= []

    addPlayer : (player) ->
      @players.push player

    removePlayer : (player) ->
      @players = _.reject(@players, (e) -> e is player)

    getPlayer : (playerId) ->
      _.find @players, (player) -> player.id is playerId

    update : (commands) ->
      @players.forEach (p1) => 
        if p1.isDestroyed()
          @removePlayer p1
        else if p1.isAlive()
          @_consolidatePlayer p1
          p1.shots.forEach @_updateShot

          @players.forEach (p2) =>
            if (p2 isnt p1) and (not p1.remote) and p1.collidesWith p2.boundingBox()
              p1.backtrack()
            p1.shots.forEach (s) =>
              #@players.forEach (p2) =>
              if s.active and (p2 isnt p1) and p2.collidesWith(s.boundingBox())
                s.active = false

                unless s.remote
                  p2.hit()
                  unless p2.isAlive()
                    console.log "Destroyed"
                    commands.push(new DestroyPlayerCommand(player : p2.id))



    _consolidatePlayer : (player) =>
       player.backtrack() if @_playerOutOfArena(player)

    _updateShot : (shot) =>
      shot.move()
      shot.active = false if @_shotOutOfArena(shot)

    _shotOutOfArena : (shot) ->
      shot.boundingBox().upperLeft.y > @height

    _playerOutOfArena : (player) ->
      boundingBox = player.boundingBox()
      boundingBox.upperLeft.x < 0 or
        boundingBox.upperLeft.y < 0 or
        boundingBox.lowerLeft.y > @height or
        boundingBox.lowerRight.x > @width
