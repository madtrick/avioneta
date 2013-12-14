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
              sprite : x : 2 , y : 2
              canvas : x : 0 , y : 0
            width : 400
            height: 400
