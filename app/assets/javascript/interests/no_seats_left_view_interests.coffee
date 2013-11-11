define ['interests'], (Interests) ->
  class Interests.NoSeatsLeftViewInterests
    constructor : (@view, bus) ->
      bus.on "arena.no_seats_left", @_handleNoSeatsLeft

    _handleNoSeatsLeft : =>
      @view.modalize()

