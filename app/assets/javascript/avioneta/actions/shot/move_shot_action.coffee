define [
  'avioneta/actions',
  'avioneta/actions/base',
  'avioneta/commands/null_command'
  ], (Actions, Base, NullCommand) ->
  class Actions.MoveShotAction extends Base
    run : (arena) ->
      arena.getShot(@options.shot).move()

    command : ->
      new NullCommand()

