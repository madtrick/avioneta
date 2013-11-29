define ['avioneta/painters'], (Painters) ->
  class Painters.PlayerBasicPainter
    paint : (canvas, model) ->
      canvas.save()
      canvas.translate(model.coordinates.x, model.coordinates.y)
      canvas.rotate(-model.rotation)
      canvas.fillStyle = model.player.color
      canvas.fillRect(-model.width/2, -model.height/2, model.width, model.height)
      canvas.fillStyle = "#000"
      canvas.fillRect(-model.width/2, -model.height/2, 2, 2)
      canvas.restore()
