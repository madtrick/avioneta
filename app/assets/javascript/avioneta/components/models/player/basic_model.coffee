define [
  'underscore',
  'avioneta/components/models/player/base_model'
  'avioneta/components/models/player',
  'avioneta/components/models/player/destroy_model',
  'avioneta/components/utils/bounding_circle',
  'avioneta/components/parts/cannon',
  'avioneta/mixins/components/player/common',
  'avioneta/painters/painter',
  'avioneta/painters/types/sprite',
  'avioneta/painters/transformations/translation',
  'avioneta/painters/transformations/rotation',
  'avioneta/painters/utils/sprite_config'
], (_, BaseModel, Player, DestroyModel,  BoundingCircle,  Cannon, Common, Painter, Sprite, Translation, Rotation, SpriteConfig ) ->
  class Player.BasicModel extends BaseModel
    radius: 16
    speed : 1

    constructor : (options) ->
      super _.extend options,
        rotation  : 0
        boundings : new BoundingCircle( radius : @radius )
        painter   : new Painter(type : new Sprite(), transformations : @painterTransformations())

      @parts = { cannons :[new Cannon(coordinates : x: 14, y : 0)]}

    move : (args) ->
      dx = @speed * Math.cos(-@rotation) * (if args.direction is "up" then 1 else -1)
      dy = @speed * Math.sin(-@rotation) * (if args.direction is "up" then 1 else -1)
      @coordinates.x += dx
      @coordinates.y += dy

    hit : ->
      @life -= 10

    destroy : (player) ->
      player.model = new DestroyModel
        coordinates : @coordinates
        behaviour : @behaviour.destroy()
        boundings : @boundings

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


  Common.mixin Player.BasicModel
