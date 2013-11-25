define [
  'avioneta/actions',
  'avioneta/actions/player/destroy_player_action',
  'avioneta/commands/destroy_player_command'
  ], (Actions, DestroyPlayerAction, DestroyPlayerCommand) ->
  class Actions.DestroyLocalPlayerAction extends DestroyPlayerAction
    command : ->
      new DestroyPlayerCommand @options
