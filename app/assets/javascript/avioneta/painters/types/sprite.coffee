define ['avioneta/painters/types/modules'], (Modules) ->
  class Modules.Sprite
    paint : (config, canvas) ->
      canvas.drawImage(
        config.sprite(),
        config.coordinatesInSprite().x,
        config.coordinatesInSprite().y,
        config.width(),
        config.height(),
        config.coordinatesInCanvas().x,
        config.coordinatesInCanvas().y,
        config.width(),
        config.height()
      )

