define ['avioneta/painters'], (Painters) ->
  class Painters.PlayerBasicPainter
    paint : (canvas, model) ->
      canvas.fillStyle = "#000"
      canvas.fillRect(model.coordinates.x, model.coordinates.y, model.width, model.height)