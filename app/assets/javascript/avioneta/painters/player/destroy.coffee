define [
  'avioneta/painters/player/elements/modules',
  'avioneta/painters/player/elements/plane',
  'avioneta/painters/player/elements/marker',
  'avioneta/tools/canvas/effects/fade_out',
  'avioneta/tools/canvas/operations'
  ], (Modules, Plane, Marker, FadeOut, Operations) ->
  class Modules.Destroy
    fadingCycles : 50

    constructor : (options) ->
      @callback = options.cb
      @elements = [new Plane()]
      @elements.push new Marker() if options.marker

      @effect = new FadeOut(duration : @fadingCycles, onFinish : @_handleFadeFinish)

    paint : (model, canvas) ->
      Operations.do canvas, =>
        @effect.apply(canvas)
        _.invoke @elements, "paint", model, canvas

    _handleFadeFinish : =>
      @callback()

