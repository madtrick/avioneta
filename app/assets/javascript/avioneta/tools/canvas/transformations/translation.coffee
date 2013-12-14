define ['avioneta/tools/canvas/transformations/modules'], (Modules) ->
  class Modules.Translation
    transform : (config, canvas) ->
      canvas.translate(config.translation.x, config.translation.y)
