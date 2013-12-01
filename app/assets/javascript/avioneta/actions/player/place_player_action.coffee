define [
  'avioneta/actions',
  'avioneta/actions/base',
  'avioneta/commands/null_command'
  ], (Actions, Base, NullCommand) ->
  class Actions.PlacePlayerAction extends Base
    run : (arena) ->
      arena.getPlayer(@options.player).place(@options.placement)

    command : ->
      new NullCommand()
