define [
  'avioneta/actions',
  'avioneta/actions/player/destroy_player_action',
  'avioneta/commands/null_command'
  ], (Actions, DestroyPlayerAction, NullCommand) ->
  class DestroyRemotePlayerAction extends DestroyPlayerAction
    command : ->
      new NullCommand()
