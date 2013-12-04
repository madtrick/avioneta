define [
  'avioneta/components/behaviours',
  'avioneta/components/behaviours/destroyed_local_player_behaviour'
], (Behaviours, DestroyedLocalPlayerBehaviour) ->
  class Behaviours.BasePlayerBehaviour
    constructor : ->

    update : (player, arena, time, services) ->
      if @placement
        @previousPlacement =
          coordinates :
            x : @placement.coordinates.x
            y : @placement.coordinates.y
          rotation : @placement.rotation

      placement = player.placement()
      @placement =
        coordinates :
          x : placement.coordinates.x
          y : placement.coordinates.y
        rotation : placement.rotation

      actions = []

      _.each arena.shots, (shot) =>
        if player isnt shot.player and services.collision_detection.detect(player.coordinates(), player.boundings(), shot.coordinates(), shot.boundings())
          console.log "Player hitted"
          actions.push new @hitPlayerAction( player : player.id, shot : shot.id )

      unless player.isAlive()
        actions.push new @destroyPlayerAction( player : player.id )
        return actions


      if arena.isElementOutOfArena(player.coordinates(), player.boundings()) or @_playerCollidesWithOtherPlayers(player, arena, services)
        actions.push new @placePlayerAction player : player.id, placement : @previousPlacement
      else
        # Calculate rotation only when moving the mouse
        mouseCoords = services.canvasMouseCoords.coordinates()
        if not @mouseCoords
          @mouseCoords = mouseCoords
          degrees = services.angleCalculator.angle(player.coordinates(), @mouseCoords)
          actions.push new @rotatePlayerAction( player : player.id, rotation : degrees )
        else if mouseCoords.x isnt @mouseCoords.x or mouseCoords.y isnt @mouseCoords.y
          @mouseCoords = mouseCoords
          degrees = services.angleCalculator.angle(player.coordinates(), @mouseCoords)
          actions.push new @rotatePlayerAction( player : player.id, rotation : degrees )

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
        actions.push new @shootPlayerAction player : player.id

      actions

    destroy : ->
      new @destroyedPlayerBehaviour()

    _xCoordinate : (player) ->
      player.model.coordinates.x

    _yCoordinate : (player) ->
      player.model.coordinates.y

    _playerCollidesWithOtherPlayers : (player, arena, services) ->
      _.find arena.players, (p) ->
        true if p isnt player and services.collision_detection.detect(player.coordinates(), player.boundings(), p.coordinates(), p.boundings())
