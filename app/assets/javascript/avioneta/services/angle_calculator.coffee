define ['avioneta/services/modules'], (Modules) ->
  class Modules.AngleCalculator
    angle : (origin, destination) ->
      if origin.y is destination.y and origin.x is destination.y
        return 0

      if origin.y is destination.y
        if destination.x < origin.x
          return Math.PI
        else
          return 0

      if origin.x is destination.x
        if origin.y < destination.y
          return (3*Math.PI)/2
        else
          return Math.PI/2

      # First quadrant 0 < alpha < 90
      if origin.x < destination.x and origin.y > destination.y
        return @_calculateAngle(@_calculateTangent(origin, destination))

      # Second quadrant 90 < alpha < 180
      if origin.x > destination.x and origin.y > destination.y
        return Math.PI - @_calculateAngle(@_calculateTangent(origin, destination))

      # Third quadrant 180 < alpha < 270
      if origin.x > destination.x and origin.y < destination.y
        return Math.PI + @_calculateAngle(@_calculateTangent(origin, destination))

      # Fourth quadrant 270 < alpha < 360
      if origin.x < destination.x and origin.y < destination.y
        return 2*Math.PI - @_calculateAngle(@_calculateTangent(origin, destination))

    _calculateTangent : (origin, destination) ->
      Math.abs(origin.y - destination.y) / Math.abs(origin.x - destination.x)

    _calculateAngle : (tangent) ->
      Math.atan(tangent)
