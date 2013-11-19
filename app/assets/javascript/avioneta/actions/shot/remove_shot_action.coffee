define [
  'avioneta/actions',
  'avioneta/actions/base',
  'avioneta/commands/null_command'
  ], (Actions, Base, NullCommand) ->
  class Actions.RemoveShotAction extends Base
    run : (arena) ->
      arena.removeShot(arena.getShot(@options.shot))

    command : ->
      new NullCommand()
