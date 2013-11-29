define ['avioneta/services'], (Services) ->
  class Services.CanvasCoordinates
    constructor : (@options) ->

    coordinates : ->
      @_coordinates or @_coordinates =  do =>
        x : @options.canvas.getBoundingClientRect().left
        y : @options.canvas.getBoundingClientRect().top
