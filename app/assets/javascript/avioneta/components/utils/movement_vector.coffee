define [
  'avioneta/components/utils'
  ], (Utils) ->
    class Utils.MovementVector
      # Vector : (x2 - x1, y2 - y1)

      constructor : (options) ->
        @x1 = options.x
        @y1 = options.y

        @x2 = @x1
        @y2 = @y1

      update : (point) ->
        @x1 = @x2
        @y1 = @y2

        @x2 = point.x
        @y2 = point.y

      x : ->
        @x2 - @x1

      y : ->
        @y2 - @y1



