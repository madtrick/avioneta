define ['avioneta/painters/transformations'], (Transformations) ->
  class Transformations.Rotation
    transform : (config, canvas) ->
      canvas.rotate(config.rotation)

