define ['avioneta/painters/transformations'], (Transformations) ->
  class Transformations.Translation
    transform : (config, canvas) ->
      canvas.translate(config.translation.x, config.translation.y)
