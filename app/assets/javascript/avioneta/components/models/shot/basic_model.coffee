define [
  'avioneta/components/models/shot',
  'avioneta/painters/shot_basic_painter',
  'avioneta/components/behaviours/shot/local',
  'avioneta/components/behaviours/shot/remote',
  'avioneta/components/utils/bounding_circle'
], (Shot, ShotBasicPainter, LocalBehaviour, RemoteBehaviour, BoundingCircle) ->
  class Shot.BasicModel
    width  : 3
    height : 3
    radius : 3

    painter : ShotBasicPainter

    constructor : (options) ->
      @boundings   = new BoundingCircle( radius : @radius )
      @painter     = new @painter()
      @coordinates = x : options.coordinates.x, y : options.coordinates.y
      @rotation    = options.rotation
      @behaviour   = if options.remote then new RemoteBehaviour() else new LocalBehaviour()
      @speed       = 1

    paint : (canvas) ->
      @painter.paint(canvas, @)

    update : (shot, arena, date, services)->
      @behaviour.update(shot, arena, date, services)

    move : ->
      # I have to negate the angle because of the flipped coordinate
      # system canvas uses. (this is leaking details from canvas implementation)
      dx = @speed * Math.cos(-@rotation)
      dy = @speed * Math.sin(-@rotation)
      @coordinates.x += dx
      @coordinates.y += dy

    hit : (shot) ->
      shot.active = false
