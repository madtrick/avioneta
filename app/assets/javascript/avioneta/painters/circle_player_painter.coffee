define ['avioneta/painters'], (Painters) ->
  class Painters.CirclePlayerPainter
    paint : (canvas, model) ->
      canvas.save()
      canvas.translate(model.coordinates.x, model.coordinates.y)
      canvas.rotate(-model.rotation)
      canvas.beginPath()
      canvas.fillStyle = model.player.color
      canvas.arc(0, 0, model.radius, 0, 2*Math.PI)
      canvas.fill()
      canvas.stroke()
      canvas.fillStyle = "#000"
      canvas.fillRect(model.radius, 0, 2, 2)
      canvas.restore()

