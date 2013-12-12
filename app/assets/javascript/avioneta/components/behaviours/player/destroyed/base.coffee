define [
  'avioneta/components/behaviours/player/destroyed/modules',
  'avioneta/actions/null_action'
], (Modules, NullAction) ->
  class Modules.DestroyedPlayerBehaviours
    constructor : ->
      @cycles = 0
    update : (player, arena, time) ->
      if @cycles is 10
        arena.removePlayer player
        @playerDestroyed(player, arena, time)

      @cycles +=1

      new NullAction()
