define [
  'avioneta/actions',
  'avioneta/actions/player/hit_player_action',
  'avioneta/commands/null_command'
  ], (Actions, HitPlayerAction, NullCommand) ->
  class Actions.HitRemotePlayerAction extends HitPlayerAction
    command : ->
      new NullCommand()
