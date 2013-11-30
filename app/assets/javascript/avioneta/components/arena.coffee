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

      @shots.forEach (s) => actions.push s.update(@, Date.now())
      @players.forEach (p) => actions.push p.update(@, Date.now(), services)

    render : (canvas) ->
      @players.forEach (player) =>
        player.paint(canvas)
        #player.shots.forEach (shot) =>
        #  shot.paint(canvas)

      @shots.forEach (shot) -> 
        console.log "Painting shot"
        shot.paint(canvas)

    isPlayerOutOfBoundings : (player) ->
      relativeBB = player.relativeBB()
      # Rotation matrix to arena coordinates
      # cos(x) -sin(x)
      # sin(x) cos(x)
      #
      rotationMatrix =
        [
          [Math.cos(player.rotation()), -Math.sin(player.rotation())]
          [Math.sin(player.rotation()), Math.cos(player.rotation())]
        ]

      rotatedUpperLeft = @vectorByMatrix(rotationMatrix, [relativeBB.upperLeft.x, relativeBB.upperLeft.y])
      rotatedUpperRight = @vectorByMatrix(rotationMatrix, [relativeBB.upperRight.x, relativeBB.upperRight.y])
      rotatedBottomRight = @vectorByMatrix(rotationMatrix, [relativeBB.bottomRight.x, relativeBB.bottomRight.y])
      rotatedBottomLeft = @vectorByMatrix(rotationMatrix, [relativeBB.bottomLeft.x, relativeBB.bottomLeft.y])

      bbRotated = @generateBB(rotatedUpperLeft, rotatedUpperRight, rotatedBottomLeft, rotatedBottomRight)

      # Translation matrix to arena coordinates
      # 1 0 player_x_coordinate
      # 0 -1 player_y_coordinate
      # 0 0 1
      translateMatrix =
        [
          [1, 0, player.coordinates().x]
          [0, -1, player.coordinates().y]
          [0, 0, 0]
        ]

      translatedUpperLeft = @vectorByMatrix(translateMatrix, [bbRotated.upperLeft.x, bbRotated.upperLeft.y, 1])
      translatedUpperRight = @vectorByMatrix(translateMatrix, [bbRotated.upperRight.x, bbRotated.upperRight.y, 1])
      translatedBottomLeft = @vectorByMatrix(translateMatrix, [bbRotated.bottomLeft.x, bbRotated.bottomLeft.y, 1])
      translatedBottomRight = @vectorByMatrix(translateMatrix, [bbRotated.bottomRight.x, bbRotated.bottomRight.y, 1])

      bbInArenaCoordinates = @generateBB(translatedUpperLeft, translatedUpperRight, translatedBottomLeft, translatedBottomRight)


      #console.log bbInArenaCoordinatesRotated
      #bbInArenaCoordinatesRotated.upperLeft.x < 0 or
      #  bbInArenaCoordinatesRotated.upperLeft.y < 0 or
      #  bbInArenaCoordinatesRotated.bottomLeft.y > @height or
      #  bbInArenaCoordinatesRotated.bottomRight.x > @width

      notInArena = not (
        @coordinateInArena(bbInArenaCoordinates.upperLeft) and
        @coordinateInArena(bbInArenaCoordinates.upperRight) and
        @coordinateInArena(bbInArenaCoordinates.bottomLeft) and
        @coordinateInArena(bbInArenaCoordinates.bottomRight)
      )

      notInArena


    coordinateInArena : (coordinate) ->
      coordinate.x > 0 and coordinate.y > 0 and coordinate.x <= @width and coordinate.y <= @height


    generateBB : (upperLeft, upperRight, bottomLeft, bottomRight) ->
      upperLeft:
        x : upperLeft[0], y : upperLeft[1]
      upperRight :
        x : upperRight[0], y : upperRight[1]
      bottomRight :
        x : bottomRight[0], y : bottomRight[1]
      bottomLeft :
        x : bottomLeft[0], y : bottomLeft[1]




    vectorByMatrix : (matrix, vector) ->
      rows = cols = matrix[0].length
      result = []

      for step in [0...rows]
        partial = 0
        for col in [0...cols]
          partial += matrix[step][col]*vector[col]

        result.push partial

      result

    

      #playerBBin

    #_consolidatePlayer : (player) =>
    #   player.backtrack() if @_playerOutOfArena(player)

    #_updateShot : (shot) =>
    #  shot.move()
    #  shot.active = false if @_shotOutOfArena(shot)

    #_shotOutOfArena : (shot) ->
    #  shot.boundingBox().upperLeft.y > @height

    #_playerOutOfArena : (player) ->
    #  boundingBox = player.boundingBox()
    #  boundingBox.upperLeft.x < 0 or
    #    boundingBox.upperLeft.y < 0 or
    #    boundingBox.lowerLeft.y > @height or
    #    boundingBox.lowerRight.x > @width
