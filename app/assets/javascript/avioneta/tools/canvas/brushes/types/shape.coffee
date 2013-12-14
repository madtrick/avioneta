define [
  'avioneta/tools/canvas/brushes/types/modules'
], (Modules) ->
  class Modules.Shape
    paint : (config, canvas) ->
      canvas.fillStyle = config.color

      if config.border
        canvas.lineWidth   = config.border.width
        canvas.strokeStyle = config.border.color

        if config.border.dash
          canvas.lineDashOffset = config.border.dash.offset
          canvas.setLineDash(config.border.dash.style)

