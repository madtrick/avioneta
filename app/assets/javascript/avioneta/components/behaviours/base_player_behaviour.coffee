define [
  'avioneta/components/behaviours',
  'avioneta/components/behaviours/destroyed_local_player_behaviour'
], (Behaviours, DestroyedLocalPlayerBehaviour) ->
  class Behaviours.BasePlayerBehaviour
    constructor : ->

    update : (player, arena, time, services) ->
      console.log @placement
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
        if player isnt shot.player and player.collidesWith(shot.boundingBox())
          actions.push new @hitPlayerAction( player : player.id, shot : shot.id )

      unless player.isAlive()
        actions.push new @destroyPlayerAction( player : player.id )
        return actions



      #console.log arena.isPlayerOutOfBoundings(player)
      console.log "PREV"
      console.log "#{@previousPlacement.coordinates.x} , #{@previousPlacement.coordinates.y} , #{@previousPlacement.rotation}"
      console.log "CUR"
      console.log "#{@placement.coordinates.x} , #{@placement.coordinates.y} , #{@placement.rotation}"

      if arena.isPlayerOutOfBoundings(player)
        actions.push new @placePlayerAction player : player.id, placement : @previousPlacement
      #if @_playerOutOfArena(player, arena) or @_playerCollidesWithOtherPlayers(player, arena)
        #actions.push new @backtrackPlayerAction( player : player.id )
      else
        # Calculate rotation only when moving the mouse
        mouseCoords = services.canvasMouseCoords.coordinates()
        if not @mouseCoords
          @mouseCoords = mouseCoords
          degrees = services.angleCalculator.angle(player.coordinates(), @mouseCoords)
          actions.push new @rotatePlayerAction( player : player.id, degrees : degrees )
        else if mouseCoords.x isnt @mouseCoords.x or mouseCoords.y isnt @mouseCoords.y
          @mouseCoords = mouseCoords
          degrees = services.angleCalculator.angle(player.coordinates(), @mouseCoords)
          actions.push new @rotatePlayerAction( player : player.id, degrees : degrees )

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
