define [
  'avioneta/actions',
  'avioneta/actions/base',
  'avioneta/commands/null_command'
  ], (Actions, Base, NullCommand) ->
  class Actions.BacktrackPlayerAction extends Base
    run : (arena) ->
      arena.getPlayer(@options.player).backtrack()

    command : ->
      new NullCommand()
