define ['avioneta/services/modules'], (Modules) ->
  class Modules.CanvasCoordinates
    constructor : (@options) ->

    coordinates : ->
      @_coordinates or @_coordinates =  do =>
        x : @options.canvas.getBoundingClientRect().left
        y : @options.canvas.getBoundingClientRect().top
