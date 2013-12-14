define [
  'underscore'
  'avioneta/components/models/shot/modules',
  'avioneta/components/models/base',
  'avioneta/components/behaviours/shot/local',
  'avioneta/components/utils/bounding_circle',
  'avioneta/painters/shot/circular'
], (_, Modules, Base, Local, BoundingCircle, Circular) ->
  class Modules.BasicModel extends Base
    width  : 3
    height : 3
    radius : 3

    speed : 3

    constructor : (options) ->
      super _.extend options,
        painter : new Circular()
        boundings : new BoundingCircle(radius : @radius)
        behaviour : new Local()

    move : ->
      # I have to negate the angle because of the flipped coordinate
      # system canvas uses. (this is leaking details from canvas implementation)
      dx = @speed * Math.cos(-@rotation)
      dy = @speed * Math.sin(-@rotation)
      @coordinates.x += dx
      @coordinates.y += dy

    hit : (shot) ->
      shot.active = false
