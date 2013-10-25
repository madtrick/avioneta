define [
  'avioneta/components/models/shot',
  'avioneta/painters/shot_basic_painter',
  'avioneta/components/utils/movement_vector'
], (Shot, ShotBasicPainter, MovementVector) ->
  class Shot.BasicModel
    width : 3
    height: 3

    painter : ShotBasicPainter

    constructor : (options) ->
      @painter     = new @painter()
      @coordinates = {x : options.x, y : options.y}
      @vector      = new MovementVector(x : @coordinates.x, y : @coordinates.y)
      @speed       = 1

    paint : (canvas) ->
      @painter.paint(canvas, @)

    move : ->
      @coordinates.y += @speed

    boundingBox : ->
      upperLeft : x : @coordinates.x, y : @coordinates.y
      upperRight: x : (@coordinates.x + @width), y : @coordinates.y
      lowerLeft : x : @coordinates.x, y : (@coordinates.y + @height)
      lowerRight: x : (@coordinates.x + @width), y : (@coordinates.y + @height)
      height : @height
      width  : @width
