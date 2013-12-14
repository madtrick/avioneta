define [
  'avioneta/modules',
  'avioneta/painters/misc/background',
], (Modules, Background) ->
    class Modules.GUI
      #
      # This game loop is strongly based
      # on the ideas found at:
      #
      # http://www.koonsolo.com/news/dewitters-gameloop/
      #

      TICKS_PER_SECOND = 30
      SKIP_TICKS       = 1000 / TICKS_PER_SECOND
      MAX_FRAMESKIP    = 10


      constructor : (attrs) ->
        @_mainCanvas        = attrs.mainCanvas
        @_backgroundCanvas  = attrs.backgroundCanvas

        @_initTickCount()
        @_nextGameTick  = @_getTickCount()

      start : (game) ->
        @_game = game
        new Background().paint(@_backgroundCanvas)
        requestAnimationFrame(@loop)

      loop : =>
        requestAnimationFrame @loop

        @_loops = 0
        while @_getTickCount() > @_nextGameTick and @_loops < MAX_FRAMESKIP
          @update()
          @_nextGameTick += SKIP_TICKS
          @_loops += 1

        @render()

      render : ->
        @_mainCanvas.clearRect(0, 0, @_mainCanvas.canvas.width, @_mainCanvas.canvas.height)
        @_game.render(@_mainCanvas)

      update : ->
        @_game.update()

      _getTickCount : ->
        Date.now() - @_initialTickCount

      _initTickCount : ->
        @_initialTickCount = Date.now()
