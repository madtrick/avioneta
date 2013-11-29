define [
  'avioneta/components/behaviours',
  'avioneta/components/behaviours/base_player_behaviour',
  'avioneta/actions/player/move_player_action',
  'avioneta/actions/player/shoot_player_action',
  'avioneta/actions/player/destroy_local_player_action',
  'avioneta/actions/player/hit_local_player_action',
  'avioneta/actions/player/backtrack_player_action',
  'avioneta/actions/player/rotate_player_action'
], (Behaviours, Base, MovePlayerAction, ShootPlayerAction, DestroyLocalPlayerAction, HitLocalPlayerAction, BacktrackPlayerAction, RotatePlayerAction) ->
  class Behaviours.LocalPlayerBehaviour extends Base
    hitPlayerAction     : HitLocalPlayerAction
    destroyPlayerAction : DestroyLocalPlayerAction
    movePlayerAction    : MovePlayerAction
    shootPlayerAction   : ShootPlayerAction
    backtrackPlayerAction : BacktrackPlayerAction
    rotatePlayerAction : RotatePlayerAction
