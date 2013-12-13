define [
  'avioneta/components/behaviours/player/destroyed/modules',
  'avioneta/actions/player/remove_player_action',
  'avioneta/actions/null_action'
], (Modules, RemovePlayerAction, NullAction) ->
  class Modules.DestroyedPlayerBehaviours
    update : (player, arena, time) ->
      if player.isDestroyed()
        @playerDestroyed(player, arena, time)
        return new RemovePlayerAction(player : player.id)

      new NullAction()
