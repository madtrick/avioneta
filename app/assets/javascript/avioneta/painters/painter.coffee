define ['underscore', 'avioneta/painters'], (_, Painters) ->
  class Painters.Painter
    constructor : (options) ->
      @type            = options.type
      @transformations = options.transformations

    paint : (config, canvas) ->
      canvas.save()
      _.invoke(@transformations, "transform", config.transformations, canvas)
      @type.paint(config.type, canvas)
      canvas.restore()

