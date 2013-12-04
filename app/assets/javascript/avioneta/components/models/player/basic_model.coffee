define [
  'underscore',
  'avioneta/components/models/player',
  'avioneta/components/models/player/base_model',
  'avioneta/components/models/player/destroy_model',
  'avioneta/painters/circle_player_painter',
  'avioneta/components/utils/bounding_circle'
], (_, Player, BaseModel, DestroyModel, CirclePlayerPainter, BoundingCircle) ->
  class Player.BasicModel extends BaseModel
    width : 100
    height: 10
    radius: 16

    painter : CirclePlayerPainter

    constructor : (options) ->
      super _.extend options,
        rotation : 0
        boundings : new BoundingCircle( radius : @radius )

    move : (args) ->
      @coordinates[args.axis] = args.value

    hit : ->
      @life -= 10

    destroy : (player) ->
      player.model = new DestroyModel
        x : @coordinates.x
        y : @coordinates.y
        behaviour : @behaviour.destroy()
        boundings : @boundings

    lifePercentage : ->
      @life

    rotate : (args) ->
      @rotation =  args.rotation
