define [
  'avioneta/actions',
  'avioneta/actions/base',
  'avioneta/commands/rotate_player_command'
], (Actions, Base, RotatePlayerCommand) ->
    class Actions.RotatePlayerAction extends Base
      run : (arena) ->
        arena.getPlayer(@options.player).rotate( rotation : @options.rotation )

      command : ->
        new RotatePlayerCommand(@options)
