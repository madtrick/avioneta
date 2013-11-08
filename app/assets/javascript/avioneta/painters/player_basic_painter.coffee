define ['avioneta/painters'], (Painters) ->
  class Painters.PlayerBasicPainter
    paint : (canvas, model) ->
      canvas.fillStyle = model.player.color
      canvas.fillRect(model.coordinates.x, model.coordinates.y, model.width, model.height)
