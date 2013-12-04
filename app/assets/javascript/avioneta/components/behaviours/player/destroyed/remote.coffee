define [
  'avioneta/components/behaviours',
  'avioneta/components/behaviours/player/destroyed/base'
], (Behaviours, Base) ->
  class Behaviours.DestroyedRemotePlayerBehaviour extends Base
    playerDestroyed : (player, arena, time) ->
