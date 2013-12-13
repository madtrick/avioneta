define [
  'underscore',
  'avioneta/components/models/player/modules',
  'avioneta/components/models/base',
  'avioneta/painters/painter',
  'avioneta/painters/types/sprite',
  'avioneta/painters/transformations/translation',
  'avioneta/painters/transformations/rotation',
  'avioneta/painters/utils/sprite_config'
], (_, Modules, Base, Painter, Sprite, Translation, Rotation, SpriteConfig) ->
  class Modules.BaseModel extends Base
    constructor : (options) ->
      super _.extend options,
        painter   : new Painter(type : new Sprite(), transformations : @painterTransformations())

      @life = options.life

    painterConfig : ->
      @_painterConfig or @_painterConfig = new SpriteConfig
        sprite : $("[data-behaviour~=image-resource]")[0]
        coordinates :
          sprite : x : 404, y :2
          canvas : x : -24, y : -24
        width : 48
        height: 48

    paintOptions : ->
      transformations :
        translation : x : @coordinates.x, y : @coordinates.y
        rotation : -@rotation #negated because of the inverted axis in canvas
      type : @painterConfig()

    painterTransformations : ->
      [
        new Translation(),
        new Rotation()
      ]
