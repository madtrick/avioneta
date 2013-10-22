define ['underscore','avioneta/components'], (_, Components) ->
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

    update : () ->
      @players.forEach @_consolidatePlayer

      @players.forEach (p1) =>
        @players.forEach (p2) =>
          if (p2 isnt p1) and (not p1.remote) and p1.collidesWith p2.boundingBox()
            p1.backtrack()

      @players.forEach (p) => p.shots.forEach @_updateShot
      @players.forEach (p) => p.shots.forEach @_consolidateShot

    _consolidatePlayer : (player) =>
      boundingBox = player.boundingBox()

      if boundingBox.upperLeft.x < 0 or
          boundingBox.upperLeft.y < 0 or
          boundingBox.lowerLeft.y > @height or
          boundingBox.lowerRight.x > @width
        player.backtrack()

    _updateShot : (shot) =>
      shot.y += 1

    _consolidateShot : (shot) =>
      if shot.x < 0 or shot.y < 0
        shot.active = false

      if shot.x + shot.width > @width
        shot.active = false

      if shot.y + shot.height > @height
        shot.active = false
