define [
  'avioneta/painters/modules'
  'avioneta/tools/canvas/brushes/brush',
  'avioneta/tools/canvas/brushes/types/circle'
  ], (Modules, Brush, Circle) ->
    class Modules.Circular
      constructor : ->
        @brush = new Brush(type : new Circle())

      paint : (model, canvas) ->
        @brush.paint(@brushOptions(model), canvas)

      brushOptions : (model) ->
        type :
          coordinates : model.coordinates
          radius      : model.radius
          color : "red"
          border :
            color : "red"
