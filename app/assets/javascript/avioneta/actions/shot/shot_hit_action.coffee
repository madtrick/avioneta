define [
  'avioneta/actions',
  'avioneta/actions/base',
  'avioneta/commands/null_command'
  ], (Actions, Base, NullCommand) ->
  class Actions.ShotHitActions extends Base
    run : (arena) ->
      arena.getShot(@options.shot).hit()

    command : ->
      new NullCommand()
