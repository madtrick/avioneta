define [
  'avioneta/tools/canvas/modules'
  ], (Modules) ->
    class Modules.Operations
      @do : (canvas, ops) ->
        canvas.save()
        ops()
        canvas.restore()


