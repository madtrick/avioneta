define [
  'underscore',
  'avioneta/components/models/player/modules',
  'avioneta/components/models/player/base_model',
  'avioneta/components/models/player/destroy_model',
  'avioneta/components/utils/bounding_circle',
  'avioneta/components/parts/cannon',
  'avioneta/mixins/components/player/common',
  'avioneta/painters/painter',
  'avioneta/painters/types/sprite',
  'avioneta/painters/transformations/translation',
  'avioneta/painters/transformations/rotation',
  'avioneta/painters/utils/sprite_config'
], (_, Modules, BaseModel, DestroyModel,  BoundingCircle,  Cannon, Common, Painter, Sprite, Translation, Rotation, SpriteConfig ) ->
  class Modules.BasicModel extends BaseModel
    radius: 16
    speed : 1

    constructor : (options) ->
      super _.extend options,
        rotation  : 0
        boundings : new BoundingCircle( radius : @radius )

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

  Common.mixin Modules.BasicModel
