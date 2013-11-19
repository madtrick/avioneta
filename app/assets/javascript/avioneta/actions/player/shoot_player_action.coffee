define [
  'avioneta/actions',
  'avioneta/actions/base',
  'avioneta/commands/shoot_player_command'
  ], (Actions, Base, ShootPlayerCommand) ->
  class Actions.ShootPlayerAction extends Base
    run : ->
    command : ->
      new ShootPlayerCommand @options
