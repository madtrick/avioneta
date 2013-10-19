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
      @players.forEach (p) => p.shots.forEach @_updateShot
      @players.forEach (p) => p.shots.forEach @_consolidateShot

    _consolidatePlayer : (player) =>
      if player.x < 0
        player.x = 0

      if player.y < 0
        player.y = 0

      if (player.x + player.width) > @width
        player.x = @width - player.width

      if player.y + player.height > @height
        player.y = @height - player.height

    _updateShot : (shot) =>
      shot.y += 1

    _consolidateShot : (shot) =>
      console.log "consolidating shot"
      if shot.x < 0 or shot.y < 0
        shot.active = false

      if shot.x + shot.width > @width
        shot.active = false

      if shot.y + shot.height > @height
        shot.active = false