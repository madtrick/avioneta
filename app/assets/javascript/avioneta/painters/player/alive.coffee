define [
  'underscore',
  'avioneta/painters/player/modules',
  'avioneta/painters/player/elements/plane',
  'avioneta/painters/player/elements/marker',
  'avioneta/tools/canvas/operations'
  ], (_, Modules, Plane, Marker, Operations) ->
  class Modules.Alive
    constructor : (options) ->
      @elements = [new Plane()]
      @elements.push new Marker() if options.marker

    paint : (model, canvas) ->
      Operations.do canvas, =>
        _.invoke @elements, "paint", model, canvas
