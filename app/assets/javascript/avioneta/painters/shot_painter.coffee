define ['avioneta/painters'], (Painters) ->
  class Painters.ShotPainter
    constructor : (canvas) ->
      @_canvas = canvas

    paint : (shot) ->
      @_canvas.fillStyle = "#ddd"
      @_canvas.fillRect(shot.x, shot.y, shot.width, shot.height)
