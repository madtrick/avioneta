define ['avioneta/painters'], (Painters) ->
  class Painters.PlayerPainter
    constructor : (canvas) ->
      @_canvas = canvas

    paint : (player) ->
      @_canvas.fillStyle = "#000"
      @_canvas.fillRect(player.x, player.y, player.width, player.height)
