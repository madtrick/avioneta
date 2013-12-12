define [
  'avioneta/modules',
  'avioneta/painters/painter',
  'avioneta/painters/types/sprite',
  'avioneta/painters/utils/sprite_config'
], (Modules, Painter, Sprite, SpriteConfig) ->
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

      #@init : (attrs)  ->
      #  requestAnimationFrame(new @(attrs).loop)

      constructor : (attrs) ->
        @_mainCanvas        = attrs.mainCanvas
        @_backgroundCanvas  = attrs.backgroundCanvas
        #@_game = attrs.game

        @_initTickCount()
        @_nextGameTick  = @_getTickCount()

      start : (game) ->
        @_game = game
        @_paintBackground()
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

      _paintBackground : ->
        painter = new Painter(type : new Sprite())
        painter.paint( @_paintBackgroundOptions(), @_backgroundCanvas )

      _paintBackgroundOptions : ->
        type : new SpriteConfig
                  sprite : $("[data-behaviour~=image-resource]")[0]
                  coordinates :
                    sprite : x : 2, y : 2
                    canvas : x : 0, y : 0
                  width : 400
                  height: 400
