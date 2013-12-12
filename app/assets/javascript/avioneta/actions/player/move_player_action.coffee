define [
  'avioneta/actions/player/modules',
  'avioneta/actions/base',
  'avioneta/commands/move_player_command'
], (Modules, Base, MovePlayerCommand) ->
  class Modules.MovePlayerAction extends Base
    run : (arena) ->
      arena.getPlayer(@options.player).move( direction : @options.direction )

    command : ->
      new MovePlayerCommand @options
