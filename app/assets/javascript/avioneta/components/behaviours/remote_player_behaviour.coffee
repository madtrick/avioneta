define [
  'avioneta/components/behaviours',
  'avioneta/components/behaviours/base_player_behaviour',
  'avioneta/components/behaviours/destroyed_remote_player_behaviour'
], (Behaviours, Base, DestroyedRemotePlayerBehaviour) ->
  class Behaviours.RemotePlayerBehaviour extends Base
    destroy : ->
      new DestroyedRemotePlayerBehaviour()
