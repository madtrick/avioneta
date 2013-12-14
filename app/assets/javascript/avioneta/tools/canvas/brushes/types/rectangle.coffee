define [
  'avioneta/tools/canvas/brushes/types/modules',
  'avioneta/tools/canvas/brushes/types/shape'
], (Modules, Shape) ->
  class Modules.Rectangle extends Shape
    paint : (config, canvas) ->
      super(config, canvas)
      canvas.fillRect(config.topLeft.x, config.topLeft.y, config.width, config.height)
