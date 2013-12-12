define [
  'avioneta/components/behaviours/modules',
  'avioneta/actions/shot/move_shot_action',
  'avioneta/actions/shot/remove_shot_action',
  'avioneta/actions/shot/shot_hit_action'
  ], (Modules, MoveShotAction, RemoveShotAction, ShotHitAction) ->
  class Modules.Base
    update : (shot, arena, date, services) ->
      if @_shotIsOutOfArena(shot, arena)
        return new RemoveShotAction( shot : shot.id )

      if player = @_shotHitsPlayer(shot, arena, services)
        actions = []
        actions.push new ShotHitAction( shot : shot.id )
        actions.push new RemoveShotAction( shot : shot.id )
        return actions

      new MoveShotAction( shot : shot.id )

    _shotIsOutOfArena : (shot, arena) ->
      arena.isElementOutOfArena(shot.coordinates(), shot.boundings())

    _shotHitsPlayer : (shot, arena, services) ->
      _.find arena.players, (player) ->
        player isnt shot.player and services.collision_detection.detect(player.coordinates(), player.boundings(), shot.coordinates(), shot.boundings())
