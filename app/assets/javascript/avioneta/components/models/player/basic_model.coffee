define [
  'underscore',
  'avioneta/components/models/player/base_model'
  'avioneta/components/models/player',
  'avioneta/components/models/player/destroy_model',
  'avioneta/components/utils/bounding_circle',
  'avioneta/components/utils/sprite_area_config',
  'avioneta/mixins/components/player/common',
  'avioneta/painters/sprite_painter'
], (_, BaseModel, Player, DestroyModel,  BoundingCircle, SpriteArenaConfig, Common, SpritePainter) ->
  class Player.BasicModel extends BaseModel
    radius: 16

    constructor : (options) ->
      super _.extend options,
        life      : 100
        rotation  : 0
        boundings : new BoundingCircle( radius : @radius )
        painter : new SpritePainter()

      @spriteConfig = new SpriteArenaConfig
        sprite : $("[data-behaviour~=image-resource]")[0]
        coordinates :
          sprite : x : 0, y :0
          canvas : x : -24, y : -24
        width : 48
        height: 48

    move : (args) ->
      @coordinates[args.axis] = args.value

    hit : ->
      @life -= 10

    destroy : (player) ->
      player.model = new DestroyModel
        coordinates : @coordinates
        behaviour : @behaviour.destroy()
        boundings : @boundings

    lifePercentage : ->
      @life

  Common.mixin Player.BasicModel
