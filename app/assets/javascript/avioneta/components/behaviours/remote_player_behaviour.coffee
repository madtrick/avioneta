define [
  'avioneta/components/behaviours',
  'avioneta/components/behaviours/base_player_behaviour',
  'avioneta/actions/player/hit_remote_player_action',
  'avioneta/actions/player/destroy_remote_player_action',
  'avioneta/actions/null_action'
], (Behaviours, Base, HitRemotePlayerAction, DestroyRemotePlayerAction, NullAction) ->
  class Behaviours.RemotePlayerBehaviour extends Base
    hitPlayerAction     : HitRemotePlayerAction
    destroyPlayerAction : DestroyRemotePlayerAction
    movePlayerAction    : NullAction
    shootPlayerAction   : NullAction
    backtrackPlayerAction : NullAction
