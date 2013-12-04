define ['avioneta/painters'], (Painters) ->
  class Painters.ShotBasicPainter
    paint : (canvas, model) ->
      canvas.fillStyle = "#ddd"
      canvas.fillRect(model.coordinates.x, model.coordinates.y, model.width, model.height)
