define [
  'avioneta/actions/shot/modules',
  'avioneta/actions/base',
  'avioneta/commands/null_command'
  ], (Modules, Base, NullCommand) ->
  class Modules.RemoveShotAction extends Base
    run : (arena) ->
      arena.removeShot(arena.getShot(@options.shot))

    command : ->
      new NullCommand()
