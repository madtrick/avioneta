define [
  'avioneta/actions/player/modules',
  'avioneta/actions/base',
  'avioneta/commands/shoot_player_command'
  ], (Modules, Base, ShootPlayerCommand) ->
  class Modules.ShootPlayerAction extends Base
    run : ->
    command : ->
      new ShootPlayerCommand @options
