define ['avioneta/painters/types'], (Types) ->
  class Types.Circle
    paint : (config, canvas) ->
      canvas.beginPath()
      canvas.fillStyle = config.color
      canvas.arc(0, 0, config.radius, 0, 2*Math.PI)
      canvas.fill()
      canvas.stroke()
