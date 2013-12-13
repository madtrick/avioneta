define [
  'avioneta/actions/modules',
  'avioneta/actions/base',
  'avioneta/commands/null_command'
], (Modules, Base, NullCommand) ->

  class Modules.RemovePlayerAction extends Base
    run : (arena) ->
      arena.removePlayer(arena.getPlayer(@options.player))

    command : ->
      new NullCommand()
