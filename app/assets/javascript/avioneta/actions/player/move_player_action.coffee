define [
  'avioneta/actions',
  'avioneta/actions/base',
  'avioneta/commands/move_player_command'
], (Actions, Base, MovePlayerCommand) ->
  class Actions.MovePlayerAction extends Base
    run : (arena) ->
      arena.getPlayer(@options.player).move( axis : @options.axis, value : @options.value )

    command : ->
      new MovePlayerCommand @options
