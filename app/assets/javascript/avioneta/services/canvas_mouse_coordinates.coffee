define ['avioneta/services/modules'], (Modules) ->
  class Modules.CanvasMouseCoordinates
    constructor : (@options) ->
      @canvasCoordsService = @options.canvasCoordsService
      @mouseCoordsService  = @options.mouseCoordsService

    coordinates : ->
      x : @mouseCoordsService.coordinates.x - @canvasCoordsService.coordinates().x
      y : @mouseCoordsService.coordinates.y - @canvasCoordsService.coordinates().y
