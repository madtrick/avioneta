define [
  'avioneta/components/behaviours/player/destroyed/modules',
  'avioneta/components/behaviours/player/destroyed/base',
  'event_bus'
], (Modules, Base, event_bus) ->
  class Modules.DestroyedLocalPlayerBehaviour extends Base
    playerDestroyed : (player, arena, time) ->
      event_bus.trigger "player.destroyed"

