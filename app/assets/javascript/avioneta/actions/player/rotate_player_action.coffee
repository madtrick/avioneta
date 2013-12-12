define [
  'avioneta/actions/player/modules',
  'avioneta/actions/base',
  'avioneta/commands/rotate_player_command'
], (Modules, Base, RotatePlayerCommand) ->
    class Modules.RotatePlayerAction extends Base
      run : (arena) ->
        arena.getPlayer(@options.player).rotate( rotation : @options.rotation )

      command : ->
        new RotatePlayerCommand(@options)
