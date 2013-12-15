define [
  'avioneta/painters/misc/modules',
  'avioneta/tools/canvas/brushes/brush',
  'avioneta/tools/canvas/brushes/types/sprite',
  'avioneta/tools/canvas/utils/sprite_config'
], (Modules, Brush, Sprite, SpriteConfig) ->
  class Modules.Background
    constructor : ->
      @brush = new Brush(type : new Sprite())

    paint : (canvas) ->
      @brush.paint(@brushOptions(), canvas)

    brushOptions : ->
      @_brushOptions or @_brushOptions =
        type :
          new SpriteConfig
            sprite : $("[data-behaviour~=image-resource]")[0]
            coordinates :
              sprite : x : 0 , y : 0
              canvas : x : 0 , y : 0
            width : 800
            height: 400
