define ['avioneta', 'avioneta/painters/player_painter'], (Avioneta, PlayerPainter) ->
  class Avioneta.GUI
    @init : (attrs)  ->
      requestAnimationFrame(new @(attrs).loop)

    constructor : (attrs) ->
      @_arena         = attrs.arena
      @_playerPainter = new PlayerPainter(attrs.canvas)
      @_canvas        = attrs.canvas

    loop : =>
      requestAnimationFrame @loop
      @render()

    render : ->
      @_canvas.clearRect(0, 0, @_arena.width, @_arena.height)

      @_arena.players.forEach (player) =>
        player.update()
        @_playerPainter.paint(player)
