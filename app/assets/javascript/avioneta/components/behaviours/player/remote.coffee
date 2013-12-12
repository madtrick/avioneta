define [
  'avioneta/components/behaviours/player/modules',
  'avioneta/components/behaviours/player/base',
  'avioneta/components/behaviours/player/destroyed/remote',
  'avioneta/actions/player/hit_remote_player_action',
  'avioneta/actions/player/destroy_remote_player_action',
  'avioneta/actions/null_action'
], (Modules, Base, DestroyedRemotePlayerBehaviour, HitRemotePlayerAction, DestroyRemotePlayerAction, NullAction) ->
  class Modules.Remote extends Base
    hitPlayerAction       : HitRemotePlayerAction
    destroyPlayerAction   : DestroyRemotePlayerAction
    movePlayerAction      : NullAction
    shootPlayerAction     : NullAction
    backtrackPlayerAction : NullAction
    rotatePlayerAction    : NullAction
    placePlayerAction     : NullAction
    destroyedPlayerBehaviour : DestroyedRemotePlayerBehaviour
