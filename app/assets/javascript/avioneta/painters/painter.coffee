define ['underscore', 'avioneta/painters/modules'], (_, Modules) ->
  class Modules.Painter
    constructor : (options) ->
      @type            = options.type
      @transformations = options.transformations

    paint : (config, canvas) ->
      canvas.save()
      _.invoke(@transformations, "transform", config.transformations, canvas)
      @type.paint(config.type, canvas)
      canvas.restore()

