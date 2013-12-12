define [
  'avioneta/actions/player/modules',
  'avioneta/actions/player/destroy_player_action',
  'avioneta/commands/null_command'
  ], (Modules, DestroyPlayerAction, NullCommand) ->
  class Modules.DestroyRemotePlayerAction extends DestroyPlayerAction
    command : ->
      new NullCommand()
