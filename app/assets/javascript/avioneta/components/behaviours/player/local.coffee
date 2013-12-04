define [
  'avioneta/components/behaviours/player',
  'avioneta/components/behaviours/player/base',
  'avioneta/components/behaviours/player/destroyed/local',
  'avioneta/actions/player/move_player_action',
  'avioneta/actions/player/shoot_player_action',
  'avioneta/actions/player/destroy_local_player_action',
  'avioneta/actions/player/hit_local_player_action',
  'avioneta/actions/player/rotate_player_action'
  'avioneta/actions/player/place_player_action'
], (Player, Base, DestroyedLocalPlayerBehaviour, MovePlayerAction, ShootPlayerAction, DestroyLocalPlayerAction, HitLocalPlayerAction, RotatePlayerAction, PlacePlayerAction) ->
  class Player.Local extends Base
    hitPlayerAction       : HitLocalPlayerAction
    destroyPlayerAction   : DestroyLocalPlayerAction
    movePlayerAction      : MovePlayerAction
    shootPlayerAction     : ShootPlayerAction
    rotatePlayerAction    : RotatePlayerAction
    placePlayerAction     : PlacePlayerAction
    destroyedPlayerBehaviour : DestroyedLocalPlayerBehaviour
