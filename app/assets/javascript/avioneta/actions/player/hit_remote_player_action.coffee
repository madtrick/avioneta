define [
  'avioneta/actions/player/modules',
  'avioneta/actions/player/hit_player_action',
  'avioneta/commands/null_command'
  ], (Modules, HitPlayerAction, NullCommand) ->
  class Modules.HitRemotePlayerAction extends HitPlayerAction
    command : ->
      new NullCommand()
