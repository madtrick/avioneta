define [
  'avioneta',
  'avioneta/painters/painter',
  'avioneta/painters/types/sprite',
  'avioneta/painters/utils/sprite_config'
], (Avioneta, Painter, Sprite, SpriteConfig) ->
  class Avioneta.Background
    constructor : ->
      @painter = new Painter(type : new Sprinte())

    paint : (canvas) ->
      @painter.paint(@paintOptions(), canvas)

    paintOptions : ->
        type : @painterConfig()

    painterConfig : ->
      @_painterConfig or @_painterConfig = new SpriteConfig
          sprite : $("[data-behaviour~=image-resource]")[0]
          coordinates :
            sprite : x : 2 , y : 2
            canvas : x : 0 , y : 0
          width : 400
          height: 400

