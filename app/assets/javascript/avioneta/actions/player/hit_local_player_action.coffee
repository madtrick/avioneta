define [
  'avioneta/actions/player/modules',
  'avioneta/actions/player/hit_player_action',
  'avioneta/commands/shot_hit_player_command'
  ], (Modules, HitPlayerAction, ShotHitPlayerCommand) ->
  class Modules.HitLocalPlayerAction extends HitPlayerAction
    command : ->
      new ShotHitPlayerCommand @options
