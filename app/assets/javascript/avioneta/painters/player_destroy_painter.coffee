define ['avioneta/painters'], (Painters) ->
  class Painters.PlayerDestroyPainter
    paint : (canvas, model) ->
      canvas.fillStyle = "red"
      canvas.fillRect(model.coordinates.x, model.coordinates.y, model.width, model.height)
