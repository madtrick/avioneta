define ['avioneta/painters/types/modules'], (Modules) ->
  class Modules.Circle
    paint : (config, canvas) ->
      canvas.beginPath()
      canvas.strokeStyle = config.color
      canvas.fillStyle = config.color
      canvas.arc(config.coordinates.x, config.coordinates.y, config.radius, 0, 2*Math.PI)
      canvas.fill()
      canvas.stroke()
