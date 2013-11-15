define [
  'avioneta/components/behaviours',
  'avioneta/components/behaviours/destroyed_player_behaviour'
], (Behaviours, Base) ->
  class Behaviours.DestroyedRemotePlayerBehaviour extends Base
    playerDestroyed : (player, arena, time) ->
