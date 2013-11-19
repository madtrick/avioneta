define [
  'avioneta/actions',
  'avioneta/actions/player/hit_player_action',
  'avioneta/commands/shot_hit_player_command'
  ], (Actions, HitPlayerAction, ShotHitPlayerCommand) ->
  class Actions.HitLocalPlayerAction extends HitPlayerAction
    command : ->
      new ShotHitPlayerCommand @options
