define [
  'avioneta/components/behaviours/shot',
  'avioneta/actions/shot/move_shot_action',
  'avioneta/actions/shot/remove_shot_action',
  'avioneta/actions/shot/shot_hit_action'
  ], (Shot, MoveShotAction, RemoveShotAction, ShotHitAction) ->
  class Shot.Base
    update : (shot, arena) ->
      if @_shotIsOutOfArena(shot, arena)
        return new RemoveShotAction( shot : shot.id )

      if player = @_shotHitsPlayer(shot, arena)
        actions = []
        actions.push new ShotHitAction( shot : shot.id )
        actions.push new RemoveShotAction( shot : shot.id )
        return actions

      new MoveShotAction( shot : shot.id )

    _shotIsOutOfArena : (shot, arena) ->
      shot.boundingBox().upperLeft.y > arena.height

    _shotHitsPlayer : (shot, arena) ->
      _.find arena.players, (player) ->
        player isnt shot.player and player.collidesWith(shot.boundingBox())
