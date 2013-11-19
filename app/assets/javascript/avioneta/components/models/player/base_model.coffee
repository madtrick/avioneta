define [
  'avioneta/components/models/player',
  'avioneta/components/utils/movement_vector'
], (Player, MovementVector) ->
  class Player.BaseModel
    constructor : (options) ->
      @painter     = new @painter()
      @coordinates = {x : options.x, y : options.y}
      @vector      = options.movementVector or new MovementVector(x : @coordinates.x, y : @coordinates.y)
      @life        = options.life or 100
      @destroyed   = options.destroyed or false
      @behaviour   = options.behaviour

    paint : (canvas) ->
      @painter.paint(canvas, @)

    collidesWith : (otherBoundingBox) ->
      bb = @boundingBox()
      bb.upperLeft.x < otherBoundingBox.lowerRight.x and
        bb.lowerRight.x > otherBoundingBox.upperLeft.x and
        bb.upperLeft.y < otherBoundingBox.lowerLeft.y and
        bb.lowerLeft.y > otherBoundingBox.upperLeft.y

    boundingBox : ->
      upperLeft : x : @coordinates.x, y : @coordinates.y
      upperRight: x : (@coordinates.x + @width), y : @coordinates.y
      lowerLeft : x : @coordinates.x, y : (@coordinates.y + @height)
      lowerRight: x : (@coordinates.x + @width), y : (@coordinates.y + @height)
      height : @height
      width  : @width

    isAlive : ->
      @life > 0

    isDestroyed : ->
      @destroyed

    update : (player, arena, time) ->
      @behaviour.update(player, arena, time)
