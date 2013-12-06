define ['avioneta/components/parts'], (Parts) ->
  class Parts.Cannon
    constructor : (@options) ->

    coordinates : ->
      @options.coordinates
