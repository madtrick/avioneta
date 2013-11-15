define [
  'avioneta/components/behaviours/shot',
  'avioneta/components/behaviours/shot/base',
  'avioneta/commands/shot_hit_player_command'
], (Shot, Base, ShotHitPlayerCommand) ->
  class Shot.Local extends Base
    #_hitPlayer : (player) ->
    #  new ShotHitPlayerCommand(player : player.id)



