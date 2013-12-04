define [
  'underscore'
  'avioneta/components/models/base'
  'avioneta/components/models/shot',
  'avioneta/painters/shot_basic_painter',
  'avioneta/components/behaviours/shot/local',
  'avioneta/components/behaviours/shot/remote',
  'avioneta/components/utils/bounding_circle'
], (_, Base, Shot, ShotBasicPainter, LocalBehaviour, RemoteBehaviour, BoundingCircle) ->
  class Shot.BasicModel extends Base
    width  : 3
    height : 3
    radius : 3

    speed : 1

    constructor : (options) ->
      super _.extend options,
        painter   : new ShotBasicPainter()
        boundings : new BoundingCircle(radius : @radius)
        behaviour : new LocalBehaviour()

    move : ->
      # I have to negate the angle because of the flipped coordinate
      # system canvas uses. (this is leaking details from canvas implementation)
      dx = @speed * Math.cos(-@rotation)
      dy = @speed * Math.sin(-@rotation)
      @coordinates.x += dx
      @coordinates.y += dy

    hit : (shot) ->
      shot.active = false
