define [
  'underscore'
  'avioneta/components/models/shot/modules',
  'avioneta/components/models/base',
  'avioneta/painters/painter',
  'avioneta/painters/types/circle',
  'avioneta/components/behaviours/shot/local',
  'avioneta/components/behaviours/shot/remote',
  'avioneta/components/utils/bounding_circle'
], (_, Modules, Base, Painter, Circle, LocalBehaviour, RemoteBehaviour, BoundingCircle) ->
  class Modules.BasicModel extends Base
    width  : 3
    height : 3
    radius : 3

    speed : 2

    constructor : (options) ->
      super _.extend options,
        painter   : new Painter( type : new Circle() )
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
        coordinates : @coordinates
        radius      : @radius
        color       : "red"
