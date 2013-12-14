define [
  'avioneta/tools/canvas/brushes/types/modules',
  'avioneta/tools/canvas/brushes/types/shape'
], (Modules, Shape) ->
  class Modules.Circle extends Shape
    paint : (config, canvas) ->
      super(config, canvas)
      canvas.beginPath()
      canvas.arc(config.coordinates.x, config.coordinates.y, config.radius, 0, 2*Math.PI)
      canvas.fill()
      canvas.stroke()
