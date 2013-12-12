define ['avioneta/components/parts/modules'], (Modules) ->
  class Modules.Cannon
    constructor : (@options) ->

    coordinates : ->
      @options.coordinates
