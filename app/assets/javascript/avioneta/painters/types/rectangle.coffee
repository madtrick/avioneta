define ['avioneta/painters/types'], (Types) ->
  class Types.Rectangle
    paint : (config, canvas) ->
      canvas.fillStyle = config.color
      canvas.fillRect(config.topLeft.x, config.topLeft.y, config.width, config.height)
