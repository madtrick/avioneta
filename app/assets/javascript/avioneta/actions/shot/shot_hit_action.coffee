define [
  'avioneta/actions/shot/modules',
  'avioneta/actions/base',
  'avioneta/commands/null_command'
  ], (Modules, Base, NullCommand) ->
  class Modules.ShotHitActions extends Base
    run : (arena) ->
      arena.getShot(@options.shot).hit()

    command : ->
      new NullCommand()
