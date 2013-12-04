define [
  'underscore',
  'avioneta/components/models/player/base_model'
  'avioneta/components/models/player',
  'avioneta/components/models/player/destroy_model',
  'avioneta/painters/circle_player_painter',
  'avioneta/components/utils/bounding_circle',
  'avioneta/mixins/components/player/common'
], (_, BaseModel, Player, DestroyModel, CirclePlayerPainter, BoundingCircle, Common) ->
  class Player.BasicModel extends BaseModel
    radius: 16

    constructor : (options) ->
      super _.extend options,
        life      : 100
        rotation  : 0
        boundings : new BoundingCircle( radius : @radius )
        painter   : new CirclePlayerPainter()

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
