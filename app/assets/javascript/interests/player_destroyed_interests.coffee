define ['interests'], (Interests) ->
  class Interests.PlayerDestroyedInterests
    constructor : (@view, bus) ->
      bus.on "player.destroyed", @_handlePlayerDestroyed

    _handlePlayerDestroyed : =>
      @view.modalize()
