define [
  'avioneta/components/behaviours',
  'avioneta/components/behaviours/base_player_behaviour',
  'avioneta/components/behaviours/destroyed_local_player_behaviour',
  'avioneta/actions/player/move_player_action',
  'avioneta/actions/player/shoot_player_action',
  'avioneta/actions/player/destroy_local_player_action',
  'avioneta/actions/player/hit_local_player_action',
  'avioneta/actions/player/rotate_player_action'
  'avioneta/actions/player/place_player_action'
], (Behaviours, Base, DestroyedLocalPlayerBehaviour, MovePlayerAction, ShootPlayerAction, DestroyLocalPlayerAction, HitLocalPlayerAction, RotatePlayerAction, PlacePlayerAction) ->
  class Behaviours.LocalPlayerBehaviour extends Base
    hitPlayerAction       : HitLocalPlayerAction
    destroyPlayerAction   : DestroyLocalPlayerAction
    movePlayerAction      : MovePlayerAction
    shootPlayerAction     : ShootPlayerAction
    rotatePlayerAction    : RotatePlayerAction
    placePlayerAction     : PlacePlayerAction
    destroyedPlayerBehaviour : DestroyedLocalPlayerBehaviour
