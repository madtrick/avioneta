define [
  'underscore'
  'avioneta/components/models/base'
  'avioneta/components/models/shot',
  'avioneta/painters/painter',
  'avioneta/painters/types/rectangle',
  'avioneta/components/behaviours/shot/local',
  'avioneta/components/behaviours/shot/remote',
  'avioneta/components/utils/bounding_circle'
], (_, Base, Shot, Painter, Rectangle, LocalBehaviour, RemoteBehaviour, BoundingCircle) ->
  class Shot.BasicModel extends Base
    width  : 3
    height : 3
    radius : 3

    speed : 2

    constructor : (options) ->
      super _.extend options,
        painter   : new Painter( type : new Rectangle() )
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

    paintOptions : ->
      type :
        topLeft : x : @coordinates.x, y : @coordinates.y
        width : @width
        height: @height
        color : "#0ee"
