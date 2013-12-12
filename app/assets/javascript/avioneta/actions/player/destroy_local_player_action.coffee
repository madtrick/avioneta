define [
  'avioneta/actions/player/modules',
  'avioneta/actions/player/destroy_player_action',
  'avioneta/commands/destroy_player_command'
  ], (Modules, DestroyPlayerAction, DestroyPlayerCommand) ->
  class Modules.DestroyLocalPlayerAction extends DestroyPlayerAction
    command : ->
      new DestroyPlayerCommand @options
