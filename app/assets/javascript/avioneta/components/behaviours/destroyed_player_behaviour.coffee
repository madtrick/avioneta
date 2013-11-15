define ['avioneta/components/behaviours', 'avioneta/commands/null_command'], (Behaviours, NullCommand) ->
  class Behaviours.DestroyedPlayerBehaviours
    constructor : ->
      @cycles = 0
    update : (player, arena, time) ->
      if @cycles is 10
        arena.removePlayer player
        @playerDestroyed(player, arena, time)

      @cycles +=1

      new NullCommand()
