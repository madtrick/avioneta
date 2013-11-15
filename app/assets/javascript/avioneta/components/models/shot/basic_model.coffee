define [
  'avioneta/components/models/shot',
  'avioneta/painters/shot_basic_painter',
  'avioneta/components/utils/movement_vector',
  'avioneta/components/behaviours/shot/local',
  'avioneta/components/behaviours/shot/remote',
], (Shot, ShotBasicPainter, MovementVector, LocalBehaviour, RemoteBehaviour) ->
  class Shot.BasicModel
    width : 3
    height: 3

    painter : ShotBasicPainter

    constructor : (options) ->
      @painter     = new @painter()
      @coordinates = {x : options.x, y : options.y}
      @vector      = new MovementVector(x : @coordinates.x, y : @coordinates.y)
      @behaviour   = if options.remote then new RemoteBehaviour() else new LocalBehaviour()
      @speed       = 1

    paint : (canvas) ->
      @painter.paint(canvas, @)

    update : (shot, arena)->
      command = @behaviour.update(@, shot, arena)

      arena.removeShot(shot) if @_isOutOfArenaBoundings(arena)
      arena.removeShot(shot) unless shot.active

      command

    move : ->
      @coordinates.y += @speed

    hit : (shot) ->
      shot.active = false
      #@behaviour.hit(@, shot, player)

    boundingBox : ->
      upperLeft : x : @coordinates.x, y : @coordinates.y
      upperRight: x : (@coordinates.x + @width), y : @coordinates.y
      lowerLeft : x : @coordinates.x, y : (@coordinates.y + @height)
      lowerRight: x : (@coordinates.x + @width), y : (@coordinates.y + @height)
      height : @height
      width  : @width

    _isOutOfArenaBoundings : (arena) ->
      @boundingBox().upperLeft.y > arena.height
