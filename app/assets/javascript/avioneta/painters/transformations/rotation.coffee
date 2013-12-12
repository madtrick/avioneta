define ['avioneta/painters/transformations/modules'], (Modules) ->
  class Modules.Rotation
    transform : (config, canvas) ->
      canvas.rotate(config.rotation)

