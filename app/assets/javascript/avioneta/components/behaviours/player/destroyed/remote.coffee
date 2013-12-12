define [
  'avioneta/components/behaviours/player/destroyed/modules',
  'avioneta/components/behaviours/player/destroyed/base'
], (Modules, Base) ->
  class Modules.DestroyedRemotePlayerBehaviour extends Base
    playerDestroyed : (player, arena, time) ->
