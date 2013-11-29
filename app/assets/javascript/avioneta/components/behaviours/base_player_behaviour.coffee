define [
  'avioneta/components/behaviours',
  'avioneta/components/behaviours/destroyed_local_player_behaviour'
], (Behaviours, DestroyedLocalPlayerBehaviour) ->
  class Behaviours.BasePlayerBehaviour
    update : (player, arena, time, services) ->
      actions = []

      _.each arena.shots, (shot) =>
        if player isnt shot.player and player.collidesWith(shot.boundingBox())
          actions.push new @hitPlayerAction( player : player.id, shot : shot.id )

      unless player.isAlive()
        actions.push new @destroyPlayerAction( player : player.id )
        return actions

      coords = services.canvasMouseCoords.coordinates()
      #console.log "MOUSE"
      #console.log coords
      #console.log "PLAYER"
      #console.log player.coordinates()
      degrees = services.angleCalculator.angle(player.coordinates(), coords)
      actions.push new @rotatePlayerAction( player : player.id, degrees : degrees )

      if @_playerOutOfArena(player, arena) or @_playerCollidesWithOtherPlayers(player, arena)
        actions.push new @backtrackPlayerAction( player : player.id )
      else
        if input.isDown 'DOWN'
          actions.push new @movePlayerAction player : player.id, axis : "y", value : (@_yCoordinate(player) + 1)
        else if input.isDown 'UP'
          actions.push new @movePlayerAction player : player.id, axis : "y", value : (@_yCoordinate(player) - 1)
        else if input.isDown 'LEFT'
          actions.push new @movePlayerAction player : player.id, axis : "x", value : (@_xCoordinate(player) - 1)
        else if input.isDown 'RIGHT'
          actions.push new @movePlayerAction player : player.id, axis : "x", value : (@_xCoordinate(player) + 1)


      if (input.isDown('SPACE') and (time - player.previousShot > player.shotTreshold or (player.previousShot is undefined))) 
        player.previousShot = time
        actions.push new @shootPlayerAction player : player.id, x : @_xCoordinate(player), y : @_yCoordinate(player)

      actions

    destroy : ->
      new DestroyedLocalPlayerBehaviour()

    _xCoordinate : (player) ->
      player.model.coordinates.x

    _yCoordinate : (player) ->
      player.model.coordinates.y

    _playerOutOfArena : (player, arena) ->
      boundingBox = player.boundingBox()
      boundingBox.upperLeft.x < 0 or
        boundingBox.upperLeft.y < 0 or
        boundingBox.lowerLeft.y > arena.height or
        boundingBox.lowerRight.x > arena.width

    _playerCollidesWithOtherPlayers : (player, arena) ->
      _.find arena.players, (p) ->
        true if p isnt player and player.collidesWith(p.boundingBox())
