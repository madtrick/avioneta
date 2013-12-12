define [
  'avioneta/actions/player/modules',
  'avioneta/actions/base',
  'avioneta/commands/null_command'
  ], (Modules, Base, NullCommand) ->
  class Modules.PlacePlayerAction extends Base
    run : (arena) ->
      arena.getPlayer(@options.player).place(@options.placement)

    command : ->
      new NullCommand()
