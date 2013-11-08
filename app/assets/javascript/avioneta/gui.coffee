define [
  'avioneta',
  'avioneta/services/command_sync',
  'avioneta/serializers/command_collection_serializer',
  'avioneta/serializers/order_collection_serializer'
  ], (Avioneta, CommandSync, CommandCollectionSerializer, OrderCollectionSerializer) ->
    class Avioneta.GUI
      #
      # This game loop is strongly based
      # on the ideas found at:
      #
      # http://www.koonsolo.com/news/dewitters-gameloop/
      #

      TICKS_PER_SECOND = 30
      SKIP_TICKS       = 1000 / TICKS_PER_SECOND
      MAX_FRAMESKIP    = 10

      @init : (attrs)  ->
        requestAnimationFrame(new @(attrs).loop)

      constructor : (attrs) ->
        @_canvas        = attrs.canvas
        @_game = attrs.game

        @_initTickCount()
        @_nextGameTick  = @_getTickCount()

      loop : =>
        requestAnimationFrame @loop

        @_loops = 0
        while @_getTickCount() > @_nextGameTick and @_loops < MAX_FRAMESKIP
          @update()
          @_nextGameTick += SKIP_TICKS
          @_loops += 1

        @render()

      render : ->
        @_canvas.clearRect(0, 0, @_canvas.canvas.width, @_canvas.canvas.height)
        @_game.render(@_canvas)

      update : ->
        @_game.update()

      _getTickCount : ->
        Date.now() - @_initialTickCount

      _initTickCount : ->
        @_initialTickCount = Date.now()
