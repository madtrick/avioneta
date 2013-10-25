define [
  'underscore',
  'avioneta/components/models/player',
  'avioneta/components/models/player/base_model',
  'avioneta/components/models/player/destroy_model',
  'avioneta/painters/player_basic_painter',
  'avioneta/components/utils/movement_vector'
], (_, Player, BaseModel, DestroyModel, PlayerBasicPainter, MovementVector) ->
  class Player.BasicModel extends BaseModel
    width : 100
    height: 5

    painter : PlayerBasicPainter

    constructor : (options) ->
      super(_.extend options, life : 100)

    move : (args) ->
      @coordinates[args.axis] = args.value
      @vector.update @coordinates

    backtrack : ->
      if @vector.x() is 0
        @coordinates.y = @coordinates.y + ((-1)*@vector.y())

      if @vector.y() is 0
        @coordinates.x = @coordinates.x +  ((-1)*@vector.x())

      @vector.update @coordinates

    hit : ->
      @life -= 10
      console.log "Hit #{@life}"

    destroy : ->
      new DestroyModel(x : @coordinates.x, y : @coordinates.y, movementVector : @vector)