define [
  'avioneta/actions/shot/modules',
  'avioneta/actions/base',
  'avioneta/commands/null_command'
  ], (Modules, Base, NullCommand) ->
  class Modules.MoveShotAction extends Base
    run : (arena) ->
      arena.getShot(@options.shot).move()

    command : ->
      new NullCommand()

