define [
  'avioneta/painters/player/elements/modules'
  'avioneta/tools/canvas/brushes/brush',
  'avioneta/tools/canvas/brushes/types/circle'
], (Modules, Brush, Circle) ->
  class Modules.Marker
    radius : 20

    constructor : ->
      @cycles     = 0
      @brush      = new Brush(type : new Circle())
      @dashoffset = 0

    paint : (model, canvas) ->
      @cycles += 1

      @brush.paint(@circleBrushConfig(model), canvas)

    circleBrushConfig : (model) ->
      if (@cycles % 4) is 0
        @dashoffset += 5

      type :
        border :
          width : 3
          color : "rgba(251, 51, 51, 0.4)"
          dash :
            offset: @dashoffset
            style : [3, 3]
        coordinates: model.coordinates
        color : "rgba(0, 0, 0, 0)"
        radius: @radius

