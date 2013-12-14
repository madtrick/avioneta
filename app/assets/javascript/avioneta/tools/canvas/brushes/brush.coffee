define [
  'underscore',
  'avioneta/tools/canvas/brushes/modules',
  'avioneta/tools/canvas/operations'
], (_, Modules, Operations) ->
  class Modules.Brush
    constructor : (options) ->
      @type            = options.type
      @transformations = options.transformations

    paint : (config, canvas) ->
      Operations.do canvas, =>
        _.invoke(@transformations, "transform", config.transformations, canvas)
        @type.paint(config.type, canvas)
