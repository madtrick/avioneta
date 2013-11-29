define [
  'avioneta/actions',
  'avioneta/actions/base',
  'avioneta/commands/null_command'], (Actions, Base, NullCommand) ->
    class Actions.RotatePlayerAction extends Base
      run : (arena) ->
        arena.getPlayer(@options.player).rorate( degrees : @options.degrees )

      command : ->
        new NullCommand()
