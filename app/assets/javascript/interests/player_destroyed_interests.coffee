define ['interests/modules'], (Modules) ->
  class Modules.PlayerDestroyedInterests
    constructor : (@view, bus) ->
      bus.on "player.destroyed", @_handlePlayerDestroyed

    _handlePlayerDestroyed : =>
      @view.modalize()
