define [
  'avioneta/components/behaviours',
  'avioneta/components/behaviours/player/destroyed/base',
  'event_bus'
], (Behaviours, Base, event_bus) ->
  class Behaviours.DestroyedLocalPlayerBehaviour extends Base
    playerDestroyed : (player, arena, time) ->
      event_bus.trigger "player.destroyed"

