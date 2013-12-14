define [
  'avioneta/tools/canvas/effects/modules'
  ], (Modules) ->
    class Modules.FadeOut
      constructor : (options) ->
        @duration = options.duration
        @onFinish = options.onFinish

      apply : (canvas) ->
        canvas.globalAlpha = 0.5 - (0.5 - @duration/100)
        @duration -= 1

        return @onFinish() if @duration is 0
