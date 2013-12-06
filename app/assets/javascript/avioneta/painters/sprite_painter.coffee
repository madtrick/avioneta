define ['avioneta/painters'], (Painters) ->
  class Painters.SpritePainter
    paint : (canvas, model) ->
      canvas.save()
      canvas.translate(model.coordinates.x, model.coordinates.y)
      canvas.rotate(-model.rotation)
      canvas.drawImage(
        model.spriteConfig.sprite(),
        model.spriteConfig.coordinatesInSprite().x,
        model.spriteConfig.coordinatesInSprite().y,
        model.spriteConfig.width(),
        model.spriteConfig.height(),
        model.spriteConfig.coordinatesInCanvas().x,
        model.spriteConfig.coordinatesInCanvas().y,
        model.spriteConfig.width(),
        model.spriteConfig.height()
      )
      canvas.restore()
