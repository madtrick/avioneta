define [
  'avioneta/components/models/player',
  'avioneta/painters/player_basic_painter',
  'avioneta/components/utils/movement_vector'
], (Player, PlayerBasicPainter, MovementVector) ->
  class Player.BasicModel
    width : 100
    height: 5

    painter : PlayerBasicPainter

    constructor : (options) ->
      @painter     = new PlayerBasicPainter()
      @coordinates = {x : options.x, y : options.y}
      @vector      = new MovementVector(x : @coordinates.x, y : @coordinates.y)

    paint : (canvas) ->
      @painter.paint(canvas, @)

    move : (args) ->
      @coordinates[args.axis] = args.value
      @vector.update @coordinates

    collidesWith : (otherBoundingBox) ->
      bb = @boundingBox()
      bb.upperLeft.x < otherBoundingBox.lowerRight.x and
        bb.lowerRight.x > otherBoundingBox.upperLeft.x and
        bb.upperLeft.y < otherBoundingBox.lowerLeft.y and
        bb.lowerLeft.y > otherBoundingBox.upperLeft.y

    backtrack : ->
      if @vector.x() is 0
        @coordinates.y = @coordinates.y + ((-1)*@vector.y())

      if @vector.y() is 0
        @coordinates.x = @coordinates.x +  ((-1)*@vector.x())

    boundingBox : ->
      upperLeft : x : @coordinates.x, y : @coordinates.y
      upperRight: x : (@coordinates.x + @width), y : @coordinates.y
      lowerLeft : x : @coordinates.x, y : (@coordinates.y + @height)
      lowerRight: x : (@coordinates.x + @width), y : (@coordinates.y + @height)
      height : @height
      width  : @width

